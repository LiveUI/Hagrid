//
//  Vertical.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 30/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Vertical positioning
public enum Vertical {
    
    /// Top of the grid
    case toTop
    
    /// Exact value from the top
    case exactly(fromTop: CGFloat)
    
    /// Below another view (view, margin)
    case below(UIView, margin: CGFloat)
    
    /// Above another view (view, margin)
    case above(UIView, margin: CGFloat)
    
    /// Maintains a position (row) under a set of elements
    case row([UIView], margin: CGFloat)
    
}
