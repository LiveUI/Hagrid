//
//  Make.swift
//  Modular
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation

/**
 Additional layout helpers
 
 Make your app fit your designs with additional layout helpers making squares, circles, heights and widths
 */
public struct Make<T> {
    
    let element: T
    let useSafeArea: Bool
    
    init(_ obj: T, useSafeArea: Bool = false) {
        element = obj
        self.useSafeArea = useSafeArea
    }
    
    /// Syntactic sugar used in chaining make methods together
    public var with: Make<T> {
        return self
    }
    
    /// Syntactic sugar used in chaining make methods together
    public var and: Make<T> {
        return self
    }
    
    /// Syntactic sugar used in chaining make methods together
    public var make: Make<T> {
        return self
    }
    
    /// Syntactic sugar used in chaining make methods together
    public var add: Make<T> {
        return self
    }
}

extension Make where T: ViewAlias {
    
    /// Return a view in question at the end of the chain
    public var view: ViewAlias {
        return element
    }
    
    public var safeArea: Make<T> {
        return Make(element, useSafeArea: true)
    }
}
