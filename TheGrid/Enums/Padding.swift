//
//  Padding.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation


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
    
    /// Sides (left, right)
    case horizontal(left: CGFloat, right: CGFloat)
    
    /// Full (top, left, right, bottom)
    case full(top: CGFloat, left: CGFloat, right: CGFloat)
    
}


extension Padding {
    
    /// UIEdgeInsets representation
    var value: UIEdgeInsets {
        switch self {
        case .top(let top):
            return UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
        case .left(let left):
            return UIEdgeInsets(top: 0, left: left, bottom: 0, right: 0)
        case .right(let right):
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: right)
        case .horizontal(let left, let right):
            return UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
        case .full(let top, let left, let right):
            return UIEdgeInsets(top: top, left: left, bottom: 0, right: right)
        case .none:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
}
