//
//  Position.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Basic position value object
public enum Position {
    
    /// Dynamic value
    static let dynamicValue = -666
    
    /// Dynamic value, snapped to the nearest column
    static let dynamicSnappedValue = -667
    
    /// Specific column on the grid
    case col(Int)
    
    /// Dynamic position
    case dynamic
    
    /// Nearest dynamically calculated column
    case dynamicallySnapped
    
}


extension Position: PositionConvertible {
    
    /// Numeric representation of the column
    public var column: Int {
        switch self {
        case .col(let column):
            return column
        case .dynamic:
            return Position.dynamicValue
        case .dynamicallySnapped:
            return Position.dynamicSnappedValue
        }
    }
    
    /// Check if the given position is dynamic
    public var isDynamicPosition: Bool {
        switch self {
        case .col(_):
            return false
        default:
            return true
        }
    }
    
}
