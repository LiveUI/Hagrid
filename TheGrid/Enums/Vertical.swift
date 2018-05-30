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
    case below(UIView, offset: CGFloat)
    
}

extension Vertical {
    
    /// Top value
    var top: CGFloat? {
        switch self {
        case .toTop:
            return 0
        case .exactly(let value):
            return value
        default:
            return nil
        }
    }
    
    var below: (view: UIView, offset: CGFloat)? {
        switch self {
        case .below(let view, let offset):
            return (view: view, offset: offset)
        default:
            return nil
        }
    }
    
}
