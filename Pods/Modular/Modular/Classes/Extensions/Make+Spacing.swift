//
//  Make+Spacing.swift
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
     Stretch view from side to side
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func sideToSide() -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.left.equalTo(viewAttributes.left)
            make.right.equalTo(viewAttributes.right)
        }
        return self
    }
    
    /**
     Stretch view from top to bottom
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func topToBottom() -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.top.equalTo(viewAttributes.top)
            make.bottom.equalTo(viewAttributes.bottom)
        }
        return self
    }
    
    /**
     Match horizontal position of another view (left & right)
     
     - parameters:
        - view: View to be matched
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func match(horizontally view: ViewAlias) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.left.equalTo(viewAttributes.left)
            make.right.equalTo(viewAttributes.right)
        }
        return self
    }
    
    /**
     Match vertical positions of another view (top & bottom)
     
     - parameters:
        - view: View to be matched
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func match(vertically view: ViewAlias) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.top.equalTo(viewAttributes.top)
            make.bottom.equalTo(viewAttributes.bottom)
        }
        return self
    }
    
    /**
     Match top position of another view
     
     - parameters:
        - view: View to be matched
        - offset: Offset (default 0)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func match(top view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.top.equalTo(viewAttributes.top).offset(offset)
        }
        return self
    }
    
    /**
     Match left position of another view
     
     - parameters:
        - view: View to be matched
        - offset: Offset (default 0)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func match(left view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.left.equalTo(viewAttributes.left).offset(offset)
        }
        return self
    }
    
    /**
     Match right position of another view
     
     - parameters:
        - view: View to be matched
        - offset: Offset (default 0)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func match(right view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.right.equalTo(viewAttributes.right).offset(offset)
        }
        return self
    }
    
    /**
     Match bottom position of another view
     
     - parameters:
        - view: View to be matched
        - offset: Offset (default 0)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func match(bottom view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.bottom.equalTo(viewAttributes.bottom).offset(offset)
        }
        return self
    }
    
    /**
     Match center position of another view (X & Y)
     
     - parameters:
        - view: View to be matched
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func match(center view: ViewAlias) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.center.equalTo(viewAttributes.center)
        }
        return self
    }
    
    /**
     Match centerX position of another view
     
     - parameters:
        - view: View to be matched
        - offset: Offset (default 0)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func match(centerX view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.centerX.equalTo(viewAttributes.centerX).offset(offset)
        }
        return self
    }
    
    /**
     Match centerY position of another view
     
     - parameters:
        - view: View to be matched
        - offset: Offset (default 0)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func match(centerY view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.centerY.equalTo(viewAttributes.centerY).offset(offset)
        }
        return self
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "sides(left:right:)")
    @discardableResult public func sideMargins(left: CGFloat = DefaultValues.leftMargin, right: CGFloat = DefaultValues.rightMargin) -> Make<T> {
        fatalError()
    }
    
    /**
     Set side margins to a view
     
     - parameters:
     - left: Left margin (default `DefaultValues.leftMargin`)
     - right: Right margin (default `DefaultValues.rightMargin`)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func sides(left: CGFloat = DefaultValues.leftMargin, right: CGFloat = DefaultValues.rightMargin) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.left.equalTo(viewAttributes.left).offset(left)
            make.right.equalTo(viewAttributes.right).offset(right)
        }
        return self
    }
    
    /**
     Set side insets to a view
     
     - parameters:
        - leading: Leading inset
        - trailing: Trailing inset
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func sides(leading: CGFloat, trailing: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.leading.equalTo(viewAttributes.leading).offset(leading)
            make.trailing.equalTo(viewAttributes.trailing).offset(trailing)
        }
        return self
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "top(_:)")
    @discardableResult public func topMargin(_ top: CGFloat = DefaultValues.topMargin) -> Make<T> {
        fatalError()
    }
    
    /**
     Set top margin to a view
     
     - parameters:
        - top: Top margin (default `DefaultValues.topMargin`)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func top(_ top: CGFloat = DefaultValues.topMargin) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.top.equalTo(viewAttributes.top).offset(top)
        }
        return self
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "left(_:)")
    @discardableResult public func leftMargin(_ left: CGFloat = DefaultValues.leftMargin) -> Make<T> {
        fatalError()
    }
    
    /**
     Set left margin to a view
     
     - parameters:
     - top: Top margin (default `DefaultValues.leftMargin`)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func left(_ left: CGFloat = DefaultValues.leftMargin) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.left.equalTo(viewAttributes.left).offset(left)
        }
        return self
    }
    
    /**
     Set leading inset to a view
     
     - parameters:
        - inset: Leading inset (default `DefaultValues.leadingInset`)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func leading(inset: CGFloat = DefaultValues.leadingInset) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.leading.equalTo(viewAttributes.leading).inset(inset)
        }
        return self
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "right(_:)")
    @discardableResult public func rightMargin(_ right: CGFloat = DefaultValues.rightMargin) -> Make<T> {
        fatalError()
    }
    
    /**
     Set right margin to a view
     
     - parameters:
        - top: Top margin (default `DefaultValues.rightMargin`)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func right(_ right: CGFloat = DefaultValues.rightMargin) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.right.equalTo(viewAttributes.right).offset(right)
        }
        return self
    }
    
    /**
     Set trailing inset to a view
     
     - parameters:
        - inset: Trailing inset (default `DefaultValues.trailingInset`)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func trailing(inset: CGFloat = DefaultValues.trailingInset) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.trailing.equalTo(viewAttributes.trailing).inset(inset)
        }
        return self
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "bottom(_:)")
    @discardableResult public func bottomMargin(_ bottom: CGFloat = DefaultValues.bottomMargin) -> Make<T> {
        fatalError()
    }
    
    /**
     Set bottom margin to a view
     
     - parameters:
        - top: Bottom margin (default `DefaultValues.bottomMargin`)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func bottom(_ bottom: CGFloat = DefaultValues.bottomMargin) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.bottom.equalTo(viewAttributes.bottom).offset(bottom)
        }
        return self
    }
    
    /**
     Center view in a superview
     
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func center() -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.center.equalTo(viewAttributes.center)
        }
        return self
    }
    
    /**
     Center view in a superview (X axis)
     
     - parameters:
        - offset: X offset (default 0)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func centerX(offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.centerX.equalTo(viewAttributes.centerX).offset(offset)
        }
        return self
    }
    
    /**
     Center view in a superview (Y axis)
     
     - parameters:
        - offset: Y offset (default 0)
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func centerY(offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.centerY.equalTo(viewAttributes.centerY).offset(offset)
        }
        return self
    }
    
    // MARK: Greater than or equal to methods
    
    /**
     Set maximum top margin to a view (greaterThanOrEqualTo)
     
     - parameters:
        - top: Top margin
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func max(against view: ViewAlias? = nil, top: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.top.greaterThanOrEqualTo(viewAttributes.top).offset(top)
        }
        return self
    }
    
    /**
     Set maximum left margin to a view (greaterThanOrEqualTo)
     
     - parameters:
        - right: Left margin
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func max(against view: ViewAlias? = nil, left: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.left.greaterThanOrEqualTo(viewAttributes.left).offset(left)
        }
        return self
    }
    
    /**
     Set maximum leading inset (greaterThanOrEqualTo)
     
     - parameters:
        - leading: Leading inset
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func max(against view: ViewAlias? = nil, leading: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.leading.greaterThanOrEqualTo(viewAttributes.leading).inset(leading)
        }
        return self
    }
    
    /**
     Set maximum right margin to a view (greaterThanOrEqualTo)
     
     - parameters:
        - right: Right margin
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func max(against view: ViewAlias? = nil, right: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.right.greaterThanOrEqualTo(viewAttributes.right).offset(right)
        }
        return self
    }
    
    /**
     Set maximum trailing inset (greaterThanOrEqualTo)
     
     - parameters:
        - trailing: Trailing inset
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func max(against view: ViewAlias? = nil, trailing: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.trailing.greaterThanOrEqualTo(viewAttributes.trailing).inset(trailing)
        }
        return self
    }
    
    /**
     Set maximum bottom margin to a view (greaterThanOrEqualTo)
     
     - parameters:
        - bottom: Bottom margin
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func max(against view: ViewAlias? = nil, bottom: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.bottom.greaterThanOrEqualTo(viewAttributes.bottom).offset(bottom)
        }
        return self
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "max(against:top:)")
    @discardableResult public func topMarginGreaterThanEqualTo(view: ViewAlias? = nil, top: CGFloat = DefaultValues.topMargin) -> Make<T> {
        fatalError()
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "max(against:top:)")
    @discardableResult public func topGreaterThanOrEqual(to view: ViewAlias? = nil, top: CGFloat = DefaultValues.topMargin) -> Make<T> {
        fatalError()
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "max(against:left:)")
    @discardableResult public func leftMarginGreaterThanEqualTo(view: ViewAlias? = nil, left: CGFloat = DefaultValues.leftMargin) -> Make<T> {
        fatalError()
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "max(against:right:)")
    @discardableResult public func rightMarginGreaterThanEqualTo(view: ViewAlias? = nil, right: CGFloat = DefaultValues.rightMargin) -> Make<T> {
        fatalError()
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "max(against:bottom:)")
    @discardableResult public func bottomMarginGreaterThanEqualTo(view: ViewAlias? = nil, bottom: CGFloat = DefaultValues.bottomMargin) -> Make<T> {
        fatalError()
    }
    
    // MARK: Less than or equal to methods
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "min(against:bottom:)")
    @discardableResult public func minBottomMargin(_ bottom: CGFloat = DefaultValues.bottomMargin) -> Make<T> {
        fatalError()
    }
    
    /**
     Set minimum top margin to a view (lessThanOrEqualTo)
     
     - parameters:
        - top: Top margin
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func min(against view: ViewAlias? = nil, top: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.top.lessThanOrEqualTo(viewAttributes.top).offset(top)
        }
        return self
    }
    
    /**
     Set minimum left margin to a view (lessThanOrEqualTo)
     
     - parameters:
        - right: Left margin
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func min(against view: ViewAlias? = nil, left: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.left.lessThanOrEqualTo(viewAttributes.left).offset(left)
        }
        return self
    }
    
    /**
     Set minimum leading inset (lessThanOrEqualTo)
     
     - parameters:
        - leading: Leading inset
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func min(against view: ViewAlias? = nil, leading: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.leading.lessThanOrEqualTo(viewAttributes.leading).inset(leading)
        }
        return self
    }
    
    /**
     Set minimum right margin to a view (lessThanOrEqualTo)
     
     - parameters:
        - right: Right margin
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func min(against view: ViewAlias? = nil, right: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.right.lessThanOrEqualTo(viewAttributes.right).offset(right)
        }
        return self
    }
    
    /**
     Set minimum trailing inset (lessThanOrEqualTo)
     
     - parameters:
        - trailing: Trailing inset
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func min(against view: ViewAlias? = nil, trailing: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.trailing.lessThanOrEqualTo(viewAttributes.trailing).inset(trailing)
        }
        return self
    }
    
    /**
     Set minimum bottom margin to a view (lessThanOrEqualTo)
     
     - parameters:
        - bottom: Bottom margin
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func min(against view: ViewAlias? = nil, bottom: CGFloat) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.bottom.lessThanOrEqualTo(viewAttributes.bottom).offset(bottom)
        }
        return self
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "min(against:top:)")
    @discardableResult public func topMarginLessThanEqualTo(view: ViewAlias? = nil, top: CGFloat = DefaultValues.topMargin) -> Make<T> {
        fatalError()
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "min(against:left:)")
    @discardableResult public func leftMarginLessThanEqualTo(view: ViewAlias? = nil, left: CGFloat = DefaultValues.leftMargin) -> Make<T> {
        fatalError()
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "min(against:right:)")
    @discardableResult public func rightMarginLessThanEqualTo(view: ViewAlias? = nil, right: CGFloat = DefaultValues.rightMargin) -> Make<T> {
        fatalError()
    }
    
    @available(*, unavailable, message: "This method has been replaced", renamed: "min(against:bottom:)")
    @discardableResult public func bottomMarginLessThanEqualTo(view: ViewAlias? = nil, bottom: CGFloat = DefaultValues.bottomMargin) -> Make<T> {
        fatalError()
    }
    
}

extension Make where T: ViewAlias {
    
    private func constraintAttributes(for view: ViewAlias? = nil) -> ConstraintBasicAttributesDSL {
        guard let view = view ?? element.superview else {
            fatalError("Expected superview but found nil when attempting to make a constraint")
        }
        return useSafeArea ? view.safeArea : view.snp
    }
    
}

extension ViewAlias {
    
    /// Safe area
    public var safeArea: ConstraintBasicAttributesDSL {
        #if os(iOS)
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.snp
        } else {
            return snp
        }
        #elseif os(tvOS)
        if #available(tvOS 11.0, *) {
            return safeAreaLayoutGuide.snp
        } else {
            return snp
        }
        #elseif os(macOS)
        return snp
        #endif
    }
    
}
