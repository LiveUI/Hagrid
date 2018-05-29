//
//  Place+Basic.swift
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


extension Place where T: ViewAlias {
    
    /**
     Place view **on** a superview and **expand** to cover all space
     
     - parameters:
        - view: target view
        - top: optional, default 0
        - left: optional, default 0
        - right: optional, default 0
        - bottom: optional, default 0
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func on(andFill view: ViewAlias, top: CGFloat? = 0, left: CGFloat? = 0, right: CGFloat? = 0, bottom: CGFloat? = 0) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.set(top: top)
            make.set(left: left)
            make.set(right: right)
            make.set(bottom: bottom)
        }
        return Make(element)
    }
    
    /**
     Place view **on** a superview
     
     - parameters:
        - view: target view
        - width: optional, default nil
        - height: optional, default nil
        - top: optional, default nil
        - left: optional, default nil
        - right: optional, default nil
        - bottom: optional, default nil
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func on(_ view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.set(top: top)
            make.set(left: left)
            make.set(right: right)
            make.set(bottom: bottom)
            make.set(width: width, height: height)
            if bottom != nil {
                make.bottom.equalToSuperview().offset(bottom!)
            }
        }
        return Make(element)
    }
    
    /**
     Place view **above** another view
     
     - parameters:
        - view: target view
        - width: optional, default nil
        - height: optional, default nil
        - top: optional, default nil
        - left: optional, default nil
        - right: optional, default nil
        - bottom: default `DefaultValues.verticalSpacingMargin` to the view below
     
     - returns: `Make` instance to allow further modifications
    */
    @discardableResult public func above(_ view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat = DefaultValues.verticalSpacingMargin) -> Make<T> {
        guard let superview = view.superview else {
            fatalError("Other view doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.set(top: top)
            make.set(left: left)
            make.set(right: right)
            make.bottom.equalTo(view.snp.top).offset(bottom)
            make.set(width: width, height: height)
        }
        return Make(element)
    }
    
    /**
     Place view **under** another view
     
     - parameters:
        - view: target view
        - width: optional, default nil
        - height: optional, default nil
        - top: default `DefaultValues.verticalSpacingMargin` to the view above
        - left: optional, default nil
        - right: optional, default nil
        - bottom: optional, default nil
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func below(_ view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat = DefaultValues.verticalSpacingMargin, left: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil) -> Make<T> {
        guard let superview = view.superview else {
            fatalError("Other view doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.bottom).offset(top)
            make.set(left: left)
            make.set(right: right)
            make.set(bottom: bottom)
            make.set(width: width, height: height)
        }
        return Make(element)
    }
    
    /**
     Place view **under** the lowest view of a given array
     
     - parameters:
        - views: target views
        - width: optional, default nil
        - height: optional, default nil
        - top: default `DefaultValues.verticalSpacingMargin` to the views above
        - left: optional, default nil
        - right: optional, default nil
        - bottom: optional, default nil
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func below(_ views: [ViewAlias], width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat = DefaultValues.verticalSpacingMargin, left: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil) -> Make<T> {
        guard let superview = views.first?.superview else {
            fatalError("One of the wiews doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            for view in views {
                make.top.greaterThanOrEqualTo(view.snp.bottom).offset(top)
            }
            make.set(left: left)
            make.set(right: right)
            make.set(bottom: bottom)
            make.set(width: width, height: height)
        }
        return Make(element)
    }
    
    /**
     Place view **next** to another view from right hand side
     
     - parameters:
        - view: target view
        - width: optional, default nil
        - height: optional, default nil
        - top: optional, default nil
        - left: default `DefaultValues.verticalSpacingMargin` to the original view on the left
        - right: optional, default nil
        - bottom: optional, default nil
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func next(to view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat? = nil, left: CGFloat = DefaultValues.horizontalSpacingMargin, right: CGFloat? = nil, bottom: CGFloat? = nil) -> Make<T> {
        guard let superview = view.superview else {
            fatalError("Other view doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.set(top: top)
            make.left.equalTo(view.snp.right).offset(left)
            make.set(right: right)
            make.set(bottom: bottom)
            make.set(width: width, height: height)
        }
        return Make(element)
    }
    
    /**
     Place view **in front** of another view from left hand side
     
     - parameters:
        - view: target view
        - width: optional, default nil
        - height: optional, default nil
        - top: optional, default nil
        - left: optional, default nil
        - right: default `DefaultValues.verticalSpacingMargin` to the original view on the right
        - bottom: optional, default nil
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func before(_ view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat = DefaultValues.horizontalSpacingMargin, bottom: CGFloat? = nil) -> Make<T> {
        guard let superview = view.superview else {
            fatalError("Other view doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.set(top: top)
            make.set(left: left)
            make.right.equalTo(view.snp.left).offset(right)
            make.set(bottom: bottom)
            make.set(width: width, height: height)
        }
        return Make(element)
    }
    
    /**
     Place view **between** two other views
     
     - parameters:
        - view1: target view on the left
        - view2: target view on the right
        - width: optional, default nil
        - height: optional, default nil
        - top: optional, default nil
        - left: default `DefaultValues.verticalSpacingMargin` to the view on the left
        - right: default `DefaultValues.verticalSpacingMargin` to the view on the right
        - bottom: optional, default nil
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func between(_ view1: ViewAlias, and view2: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat? = nil, left: CGFloat = DefaultValues.horizontalSpacingMargin, right: CGFloat = -DefaultValues.horizontalSpacingMargin, bottom: CGFloat? = nil) -> Make<T> {
        guard let superview = view1.superview, let _ = view2.superview else {
            fatalError("One of the other views doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.set(top: top)
            make.left.equalTo(view1.snp.right).offset(left)
            make.right.equalTo(view2.snp.left).offset(right)
            make.set(bottom: bottom)
            make.set(width: width, height: height)
        }
        return Make(element)
    }
    
    /**
     Place view at the **bottom** of another view
     
     - parameters:
        - bottom: target view
        - width: optional, default nil
        - height: optional, default nil
        - top: optional, default nil
        - left: optional, default nil
        - right: optional, default nil
        - bottom: default 0
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func on(bottom view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat = 0) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.set(top: top)
            make.set(left: left)
            make.set(right: right)
            make.bottom.equalToSuperview().offset(bottom)
            make.set(width: width, height: height)
        }
        return Make(element)
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "on(bottom:width:height:top:left:right:bottom:)")
    public func onBottom(of view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, bottom: CGFloat = 0) -> Make<T> {
        fatalError()
    }
    
    /**
     Place view to the **top left** corner of another view
     
     - parameters:
        - topLeft: target view
        - width: optional, default nil
        - height: optional, default nil
        - top: default 0
        - left: default 0
        - right: optional, default nil
        - bottom: optional, default nil
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func on(topLeft view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat = 0, left: CGFloat = 0, right: CGFloat? = nil, bottom: CGFloat? = nil) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.set(top: top)
            make.set(left: left)
            make.set(right: right)
            make.set(bottom: bottom)
            make.set(width: width, height: height)
        }
        return Make(element)
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "on(topLeft:width:height:top:left:right:bottom:)")
    public func onTopLeft(of view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat? = nil, left: CGFloat? = nil) -> Make<T> {
        fatalError()
    }
    
    /**
     Place view to the **top right** corner of another view
     
     - parameters:
        - topRight: target view
        - width: optional, default nil
        - height: optional, default nil
        - top: default 0
        - left: optional, default NIL
        - right: default 0
        - bottom: optional, default nil
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func on(topRight view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat? = 0, left: CGFloat? = nil, right: CGFloat? = 0, bottom: CGFloat? = nil) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.set(top: top)
            make.set(left: left)
            make.set(right: right)
            make.set(bottom: bottom)
            make.set(width: width, height: height)
        }
        return Make(element)
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "on(topRight:width:height:top:left:right:bottom:)")
    public func onTopRight(of view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat? = nil, right: CGFloat? = nil) -> Make<T> {
        fatalError()
    }
    
}

