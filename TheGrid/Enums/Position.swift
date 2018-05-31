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
    
    /// Specific column on the grid
    case col(Int)
    
    /// Last column on a grid view
    case last
    
    /// N-th column from the end
    case reversed(Int)
    
    /// Up to another element
    case relation(UIView, margin: CGFloat)
    
    /// Match position of another view
    case match(UIView, margin: CGFloat)
    
    /// Dynamic position
    case dynamic
    
    /// Custom position for a given size class (trait collection)
    case custom(((_ traitCollection: UITraitCollection) -> Position))
    
    /// First column
    public static var first: Position { return .col(0) }
    
}
