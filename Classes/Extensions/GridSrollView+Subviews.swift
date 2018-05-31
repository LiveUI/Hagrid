//
//  GridSrollView+Subviews.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 31/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import SnapKit


extension GridScrollView {
    
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
        gridView.addSubview(subview)
    }
    
    @available(*, unavailable, message: "This method is unavailable, please use add(subview:_:from:space:padding:redraw:) instead")
    open override func addSubview(_ view: UIView) {
        fatalError("Add subview is not supported on a GridView")
    }
    
}
