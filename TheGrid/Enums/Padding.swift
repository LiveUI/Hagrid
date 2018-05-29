//
//  Padding.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Element padding
public enum Padding {
    
    /// None
    case none
    
    /// Top
    case top(CGFloat)
    
    /// Left
    case left(CGFloat)
    
    /// Right
    case right(CGFloat)
    
    /// Bottom
    case bottom(CGFloat)
    
    /// Sides (left, right)
    case horizontal(CGFloat, CGFloat)
    
    /// Vertical (top, bottom)
    case vertical(CGFloat, CGFloat)
    
    /// Full (top, left, right, bottom)
    case full(CGFloat, CGFloat, CGFloat, CGFloat)
    
}


extension Padding {
    
    /// UIEdgeInsets representation
    var value: UIEdgeInsets {
        switch self {
        case .left(let left):
            return UIEdgeInsets(top: 0, left: left, bottom: 0, right: 0)
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
}
