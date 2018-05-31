//
//  Position.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation


/// Basic position value object
public struct Position: ExpressibleByIntegerLiteral {
    
    /// Internal storage enum
    enum Storage {
        
        /// Specific column on the grid
        case col(Int)
        
        /// Last column on a grid view
        case last
        
        /// N-th column from the end
        case reversed(Int)
        
        /// Up to another element
        case relation(ViewAlias, margin: CGFloat)
        
        /// Match position of another view
        case match(ViewAlias, margin: CGFloat)
        
        /// Dynamic position
        case dynamic
        
        #if os(iOS) || os(tvOS)
        /// Custom position for a given size class (trait collection)
        case custom(((_ traitCollection: NSTraitCollection) -> Position))
        #endif
        
    }
    
    /// Storage
    var storage: Storage
    
    /// Initializer
    init(_ value: Storage) {
        storage = value
    }
    
    /// Specific column on the grid
    public static func col(_ value: Int) -> Position { return .init(.col(value)) }
    
    /// Last column on a grid view
    public static var last: Position { return .init(.last) }
    
    /// N-th column from the end
    public static func reversed(_ value: Int) -> Position { return .init(.reversed(value)) }
    
    /// Up to another element
    public static func relation(_ view: ViewAlias, margin: CGFloat = 0) -> Position { return .init(.relation(view, margin: margin)) }
    
    /// Match position of another view
    public static func match(_ view: ViewAlias, margin: CGFloat = 0) -> Position { return .init(.match(view, margin: margin)) }
    
    /// Dynamic position
    public static var dynamic: Position { return .init(.dynamic) }
    
    #if os(iOS) || os(tvOS)
    /// Custom position for a given size class (trait collection)
    public static func custom(_ closure: @escaping ((_ traitCollection: UITraitCollection) -> Position)) -> Position { return .init(.custom(closure)) }
    #endif
    
    /// First column
    public static var first: Position { return .col(0) }
    
    /// Initialize with a number
    public init(integerLiteral value: Int) {
        storage = .col(value)
    }
    
}
