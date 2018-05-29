//
//  PositionConvertible.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation


/// Convertible to a position on a grid
public protocol PositionConvertible {
    
    /// Numeric representation of the column
    var column: Int { get }
    
    var isDynamicPosition: Bool { get }
    
}

extension PositionConvertible {
    
    /// Check if the given position is dynamic
    public var isDynamicPosition: Bool {
        return false
    }
    
}

extension Int: PositionConvertible {
    
    /// Numeric representation of a GridView column
    public var column: Int {
        return self
    }
    
}
