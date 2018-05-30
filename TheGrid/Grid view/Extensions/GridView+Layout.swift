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
            if var top = subview.properties.vertical.top {
                top += config.padding.value.top
                make.top.equalTo(top)
            } else if let below = subview.properties.vertical.below {
                make.top.equalTo(below.view.snp.bottom).offset(below.offset)
            }
            
            // Left
            let left = (self.x(subview.properties.from) + subview.properties.padding.value.left)
            make.left.equalTo(left)
            
            // Right
            if !subview.properties.space.isDynamicPosition {
                let column = subview.properties.space.column
                let right: CGFloat
                if column >= 0 { // Defined column
                    right = self.x(subview.properties.from + column)
                } else if column > -666 { // N-th column from the end
                    right = self.x(config.numberOfColumns + column)
                } else if column == Position.lastValue { // Last column
                    right = self.x(config.numberOfColumns)
                } else { // Not implemented, should not really happen!
                    fatalError("Position is not implemented or is not a real value!")
                }
                make.width.equalTo(right - left)
            }
            
            // Run custom constraints
            subview.properties.redraw?(make)
        }
    }
    
}
