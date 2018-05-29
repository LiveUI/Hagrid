//
//  Subview.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Subview
public struct Subview {
    
    /// Subview properties
    public let properties: Properties
    
    /// View
    public let view: UIView
    
}


extension Subview: Hashable {
    
    /// Subviews hash value (equals hash value of it's view)
    public var hashValue: Int {
        return view.hashValue
    }
    
}


extension Subview: Equatable {
    
    public static func ==(lhs: Subview, rhs: Subview) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
}
