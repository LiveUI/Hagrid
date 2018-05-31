//
//  GridViewInterface.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 31/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Public interface for any grid view type
public protocol GridViewInterface {
    
    /// Grid view configuration
    var config: GridView.Config { get }
    
    /// Grid subviews
    var gridSubviews: [Subview] { get }
    
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
    func add(subview view: UIView, _ vertical: Vertical?, from: Position, space: Position, padding: Padding, redraw: ((_ make: ConstraintMaker) -> Void)?)
    
}
