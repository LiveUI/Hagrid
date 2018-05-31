//
//  GridView+Calculations.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation


extension GridView {
    
    /// Pixel position for column
    func x(_ column: Int) -> CGFloat {
        return (CGFloat(column) * config.columnWidth) + config.padding.value.left
    }
    
}

extension GridView.Config {
    
    /// Recalculate cache
    func recalculate() {
        columnWidth = calculatedColumnWidth()
    }
    
    /// Column width
    private func calculatedColumnWidth() -> CGFloat {
        let availableWidth = (element.bounds.size.width - (padding.value.left + padding.value.right))
        let columnWidth = (availableWidth / CGFloat(numberOfColumns))
        return columnWidth
    }
    
}
