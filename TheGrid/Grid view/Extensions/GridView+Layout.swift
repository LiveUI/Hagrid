//
//  GridView+Layout.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


extension GridView {
    
    /// Layout subviews override
    @available(*, unavailable, message: "This method is unavailable")
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        config.recalculate()
        config.reDraw()
        
        for subview in gridSubviews {
            layout(subview)
        }
    }
    
    /// Layout a single Subview
    func layout(_ subview: Subview) {
        subview.view.snp.remakeConstraints { (make) in
            // Top
            if let vertical = subview.properties.vertical {
                switch vertical {
                case .toTop:
                    make.top.equalTo(config.padding.value.top)
                case .exactly(fromTop: let top):
                    make.top.equalTo(top)
                case .below(let view, margin: let margin):
                    make.top.equalTo(view.snp.bottom).offset(margin)
                case .above(let view, margin: let margin):
                    make.bottom.equalTo(view.snp.top).offset(-margin)
                case .row(let views, margin: let margin):
                    for view in views {
                        make.top.greaterThanOrEqualTo(view.snp.bottom).offset(margin)
                    }
                }
            } else {
                make.top.greaterThanOrEqualTo(config.padding.value.top)
            }
            
            // Left
            func setLeft(position: Position) {
                let leftPadding = subview.properties.padding.value.left
                switch position {
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
                case .dynamicallySnapped:
                    fatalError("Not implemented")
                case .relation(let view, margin: let margin):
                    make.left.equalTo(view.snp.right).offset(margin + leftPadding)
                case .custom(let closure):
                    setLeft(position: closure(traitCollection))
                }
            }
            setLeft(position: subview.properties.from)
            
            // Right
            func setRight(position: Position) {
                let rightPadding = subview.properties.padding.value.right
                let fullRightPadding = -(rightPadding + config.padding.value.right)
                switch position {
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
                case .dynamicallySnapped:
                    fatalError("Not implemented")
                case .relation(let view, margin: let margin):
                    make.right.equalTo(view.snp.left).offset(margin - rightPadding)
                case .custom(let closure):
                    setRight(position: closure(traitCollection))
                }
            }
            setRight(position: subview.properties.space)
            
            // Run custom constraints
            subview.properties.redraw?(make)
        }
    }
    
}
