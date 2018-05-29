//
//  Make+Dimensions.swift
//  Pods
//
//  Created by Ondrej Rafaj on 03/12/2017.
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
     Set width of a view
     
     - parameters:
        - width: Width of the view
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func width(_ width: CGFloat) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.width.equalTo(width)
        }
        return self
    }
    
    /**
     Set height of a view
     
     - parameters:
        - width: Height of the view
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func height(_ height: CGFloat) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.height.equalTo(height)
        }
        return self
    }
    
    /**
     Match width and height of another view
     
     - parameters:
        - view: View to be matched
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func match(dimensions view: ViewAlias) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.width.height.equalTo(view)
        }
        return self
    }
    
    /**
     Match width of another view
     
     - parameters:
        - view: View to be matched
        - offset: Offset (default 0)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func match(width view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.width.equalTo(view).offset(offset)
        }
        return self
    }
    
    /**
     Match height of another view
     
     - parameters:
        - view: View to be matched
        - offset: Offset (default 0)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func match(height view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.height.equalTo(view).offset(offset)
        }
        return self
    }
    
    
    
}
