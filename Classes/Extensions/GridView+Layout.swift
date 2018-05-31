//
//  GridView+Layout.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
#if os(iOS) || os(tvOS)
@_exported import UIKit
#elseif os(OSX)
@_exported import Cocoa
#endif


extension GridView {
    
    #if os(iOS) || os(tvOS)
    /// Layout subviews override
    @available(*, unavailable, message: "This method is unavailable")
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        executeLayout()
    }
    #elseif os(OSX)
    /// Layout subviews override
    @available(*, unavailable, message: "This method is unavailable")
    open override func layout() {
        macLayout()
    }
    
    /// Mac layout
    func macLayout() {
        super.layout()
        
        executeLayout()
    }
    #endif
    
    /// Execute layout
    private func executeLayout() {
        if self.superview != nil {
            config.recalculate()
            config.reDraw()
            
            for subview in gridSubviews {
                layout(subview)
            }
        }
    }
    
    /// Layout a single Subview
    func layout(_ subview: Subview) {
        subview.view.snp.remakeConstraints { (make) in
            // Top
            self.make(subview, top: make)
            
            // Left
            self.make(subview, left: make)
            
            // Right
            self.make(subview, right: make)
            
            // Dynamic size
            if config.autoDynamicVertically {
                make.bottom.lessThanOrEqualTo(self.snp.bottom)
            }
            if config.autoDynamicHorizontally {
                make.right.lessThanOrEqualTo(self.snp.right)
            }
            
            // Run custom constraints
            subview.properties.redraw?(make)
        }
    }
    
    /// Build top constraints
    private func make(_ subview: Subview, top make: ConstraintMaker) {
        if let vertical = subview.properties.vertical {
            func set(vertical: Vertical) {
                switch vertical.storage {
                case .exactly(fromTop: let top):
                    make.top.equalTo(top + config.padding.value.top)
                case .match(let view, margin: let margin):
                    make.top.equalTo(view).offset(margin)
                case .below(let view, margin: let margin):
                    make.top.equalTo(view.snp.bottom).offset(margin)
                case .above(let view, margin: let margin):
                    make.bottom.equalTo(view.snp.top).offset(-margin)
                case .row(let views, margin: let margin):
                    for view in views {
                        make.top.greaterThanOrEqualTo(view.snp.bottom).offset(margin)
                    }
                #if os(iOS) || os(tvOS)
                case .custom(let closure):
                    set(vertical: closure(traitCollection))
                #endif
                }
            }
            set(vertical: vertical)
        } else {
            make.top.greaterThanOrEqualTo(config.padding.value.top)
        }
    }
    
    /// Build left constraints
    private func make(_ subview: Subview, left make: ConstraintMaker) {
        func setLeft(position: Position) {
            let leftPadding = subview.properties.padding.value.left
            switch position.storage {
            case .col(let column):
                let left = (self.x(column) + leftPadding)
                make.left.equalTo(left)
            case .reversed(let column):
                let left = (self.x((config.numberOfColumns - column)) + leftPadding)
                make.left.equalTo(left)
            case .last:
                make.width.equalTo(self.x(config.numberOfColumns - 1))
            case .dynamic:
                break
            case .match(let view, margin: let margin):
                make.left.equalTo(view).offset(margin + leftPadding)
            case .relation(let view, margin: let margin):
                make.left.equalTo(view.snp.right).offset(margin + leftPadding)
            #if os(iOS) || os(tvOS)
            case .custom(let closure):
                setLeft(position: closure(traitCollection))
            #endif
            }
        }
        setLeft(position: subview.properties.from)
    }
    
    /// Build right constraints
    private func make(_ subview: Subview, right make: ConstraintMaker) {
        func setRight(position: Position) {
            let rightPadding = subview.properties.padding.value.right
            let fullRightPadding = -(rightPadding + config.padding.value.right)
            switch position.storage {
            case .col(let column):
                if column >= 0 && column < config.numberOfColumns { // Defined column
                    let col = config.numberOfColumns - (config.numberOfColumns - column)
                    make.width.equalTo((CGFloat(col) * config.columnWidth) - rightPadding)
                } else {
                    make.right.equalTo(fullRightPadding)
                }
            case .reversed(let column):
                make.right.equalTo(fullRightPadding - (CGFloat(column) * config.columnWidth))
            case .last:
                make.right.equalTo(fullRightPadding)
            case .dynamic:
                break
            case .match(let view, margin: let margin):
                make.right.equalTo(view).offset(margin - rightPadding)
            case .relation(let view, margin: let margin):
                make.right.equalTo(view.snp.left).offset(margin - rightPadding)
            #if os(iOS) || os(tvOS)
            case .custom(let closure):
                setRight(position: closure(traitCollection))
            #endif
            }
        }
        setRight(position: subview.properties.space)
    }
    
}
