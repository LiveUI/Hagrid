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
        config.redraw()
        
        for subview in gridSubviews {
            layout(subview)
        }
    }
    
    /// Layout a single Subview
    func layout(_ subview: Subview) {
        subview.view.snp.remakeConstraints { (make) in
            // Top
            make.top.equalTo(subview.properties.top)
            
            // Left
            let left = (self.x(subview.properties.pos) + subview.properties.padding.value.left)
            make.left.equalTo(left)
            
            // Right
            if !subview.properties.space.isDynamicPosition {
                // Start column + number of columns
                let right = self.x((subview.properties.pos + subview.properties.space.column))
                make.width.equalTo((right - left))
            }
            
            subview.properties.redraw?(make)
        }
    }
    
}
