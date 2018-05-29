//
//  Make+Shapes.swift
//  Modular
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation
#if os(iOS) || os(tvOS)
    @_exported import UIKit
#elseif os(OSX)
    @_exported import Cocoa
#endif
@_exported import SnapKit


extension Make where T: ViewAlias {
    
    /**
     Make view square in shape
     
     - parameters:
        - side: Common side to define width and height (optional, default nil)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func square(side: CGFloat? = nil) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.width.equalTo(element.snp.height)
            guard let height = side else {
                return
            }
            make.height.equalTo(height)
        }
        return self
    }
    
    /**
     Make view rectangular in shape
     
     - parameters:
        - width: Width of the rectangle
        - height: Height of the rectangle
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func rectangle(width: CGFloat, height: CGFloat) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        return self
    }
    
    #if os(iOS) || os(tvOS)
    
    /**
     Make view circular in shape
     
     - parameters:
        - radius: Size of the circle
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func circle(radius: CGFloat) -> Make<T> {
        square(side: radius)
        element.layer.cornerRadius = (radius / 2.0)
        element.clipsToBounds = true
        return self
    }
    
    #endif
    
    
}
