//
//  GridView+Calculations.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


extension GridView {
    
    /// Pixel position for column
    func x(_ column: Int) -> CGFloat {
        return CGFloat(column) * config.values.columnWidth
    }
    
}

extension GridView.Config {
    
    /// Recalculate cache
    func recalculate() {
        values.columnWidth = columnWidth()
    }
    
    /// Column width
    private func columnWidth() -> CGFloat {
        let w = element.bounds.size.width / CGFloat(numberOfColumns)
        return w
    }
    
}
