//
//  Place.swift
//  Nimble
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation
#if os(iOS) || os(tvOS)
    @_exported import UIKit
#elseif os(OSX)
    @_exported import Cocoa
#endif

/**
 Placing views on stage
 */
public struct Place<T> {
    
    let element: T
    
    init(_ obj: T) {
        element = obj
    }
    
}


extension Place where T: ViewAlias {
    
    /// Return a view in question at the end of the chain
    public var view: ViewAlias {
        return element
    }
    
}
