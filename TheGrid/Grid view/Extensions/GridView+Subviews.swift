//
//  GridView+Subviews.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
import SnapKit


extension GridView {
    
    /**
     Add subview
     
     - parameters:
        - view: View to be added
        - pos: Position on the grid
        - columns: Number of columns to fill
     */
    public func addSubview(_ view: UIView,
                           top: CGFloat = 0,
                           pos: PositionConvertible,
                           columns: PositionConvertible,
                           padding: Padding = .none,
                           redraw: ((_ make: ConstraintMaker) -> Void)? = nil) {
        let subview = Subview(
            properties: Properties(
                top: top,
                pos: pos.column,
                space: columns,
                redraw: redraw,
                padding: padding
            ),
            view: view
        )
        addSubview(subview)
    }
    
    @available(*, unavailable, message: "This method is unavailable, please use addSubview(_:pos:columns:padding:) instead")
    open override func addSubview(_ view: UIView) {
        fatalError("Add subview is not supported on a GridView")
    }
    
}

extension GridView {
    
    /// Add a real! subview
    func addSubview(_ subview: Subview) {
        gridSubviews.append(subview)
        super.addSubview(subview.view)
    }
    
}

extension GridView {
    
    /// Will remove subview from grid view
    open override func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
        
        cleanGridSubviews()
    }
    
    /// Clean grid subviews
    func cleanGridSubviews() {
        gridSubviews.filter({ $0.view.superview == nil }).map({ gridSubviews.index(of: $0) }).forEach({
            guard let index = $0 else {
                return
            }
            gridSubviews.remove(at: index)
        })
    }
    
}
