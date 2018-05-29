//
//  Class.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Class representing different screensizes
public struct Class {
    
    /// Sizes
    let sizes: [Device: Position]
    
    /// Initializer
    public init(_ sizes: [Device: Position]) {
        self.sizes = sizes
    }
    
}


extension Class: PositionConvertible {
    
    /// Numeric representation of the column
    public var column: Int {
        return 1
    }
    
}
