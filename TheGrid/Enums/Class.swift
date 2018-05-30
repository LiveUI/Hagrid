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
    
    /// Size object
    public struct Size {
        
        /// Device details
        public let device: Device
        
        /// Position
        public let position: Position
        
    }
    
    /// Sizes
    let sizes: [Size]
    
    /**
     Initializer, first size in the array will be considered 
     */
    public init(_ sizes: [Size]) {
        guard sizes.count > 0 else {
            fatalError("Sizes need to contain at least one value")
        }
        self.sizes = sizes
    }
    
}


extension Class: PositionConvertible {
    
    /// Position fitting current device and it's state
    public var position: Position {
        return .col(1)
    }
    
}
