//
//  Vertical.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 30/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation


/// Vertical positioning
public struct Vertical: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    
    /// Internal storage enum
    enum Storage {
        
        /// Don't set vertical position
        case none
        
        /// Center horizontally in superview
        case centerY
        
        /// Exact value from the top
        case exactly(fromTop: CGFloat)
        
        /// Match top of another view
        case match(ViewAlias, margin: CGFloat)
        
        /// Below another view (view, margin)
        case below(ViewAlias, margin: CGFloat)
        
        /// Above another view (view, margin)
        case above(ViewAlias, margin: CGFloat)
        
        /// Maintains a position (row) under a set of elements
        case row([ViewAlias], margin: CGFloat)
        
        #if os(iOS) || os(tvOS)
        /// Custom vertical position for a given size class (trait collection)
        case custom(((_ traitCollection: UITraitCollection) -> Vertical))
        #endif
        
    }
    
    /// Storage
    var storage: Storage
    
    /// Initializer
    init(_ value: Storage) {
        storage = value
    }
    
    /// Don't set vertical position
    public static var none: Vertical { return .init(.none) }
    
    /// Center horizontally in superview
    public static var centerY: Vertical { return .init(.centerY) }
    
    /// Top of the grid
    public static var toTop: Vertical { return .exactly(fromTop: 0) }
    
    /// Exact value from the top
    public static func exactly(fromTop: CGFloat) -> Vertical { return .init(.exactly(fromTop: fromTop)) }
    
    /// Match top of another view
    public static func match(_ view: ViewAlias, margin: CGFloat = 0) -> Vertical { return .init(.match(view, margin: margin)) }
    
    /// Maintains a position under a set of elements
    public static func below(_ views: [ViewAlias], margin: CGFloat = 0) -> Vertical { return .init(.row(views, margin: margin)) }
    
    /// Below another view (view, margin)
    public static func below(_ view: ViewAlias, margin: CGFloat = 0) -> Vertical { return .init(.below(view, margin: margin)) }
    
    /// Above another view (view, margin)
    public static func above(_ view: ViewAlias, margin: CGFloat = 0) -> Vertical { return .init(.above(view, margin: margin)) }
    
    #if os(iOS) || os(tvOS)
    /// Custom vertical position for a given size class (trait collection)
    public static func custom(_ closure: @escaping ((_ traitCollection: UITraitCollection) -> Vertical)) -> Vertical { return .init(.custom(closure)) }
    #endif
    
    /// Initialize with a Float
    public init(floatLiteral value: Float) {
        storage = .exactly(fromTop: CGFloat(value))
    }
    
    /// Initialize with an Int
    public init(integerLiteral value: Int) {
        storage = .exactly(fromTop: CGFloat(value))
    }
    
}
