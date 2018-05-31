//
//  GridView+Subviews.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import SnapKit


extension GridView {
    
    /**
     Add subview
     
     - parameters:
         - view: View to be added
         - top: Top margin
         - pos: Position on the grid
         - space: Number of columns to fill
         - padding: Subview padding on the grid
         - redraw: SnapKit make closure for that fine tunning we all need
     */
    public func add(subview view: UIView, _ vertical: Vertical? = nil, from: Position = .first, space: Position = .last, padding: Padding = .none, redraw: ((_ make: ConstraintMaker) -> Void)? = nil) {
        let subview = Subview(
            properties: Properties(
                vertical: vertical,
                from: from,
                space: space,
                redraw: redraw,
                padding: padding
            ),
            view: view
        )
        addSubview(subview)
    }
    
    @available(*, unavailable, message: "This method is unavailable, please use add(subview:_:from:space:padding:redraw:) instead")
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
