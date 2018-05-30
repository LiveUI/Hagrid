//
//  GridViewController.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Grid view view controller
open class GridViewController: UIViewController {
    
    /**
     Grid view
     
     - important: Replaces default `view`
     */
    open let gridView = GridView()
    
    /// Original view (removed)
    @available(*, unavailable, message: "This property is unavailable", renamed: "gridView")
    open override var view: UIView! {
        get { return gridView }
        set { }
    }
    
    // MARK: View lifecycle
    
    @available(*, unavailable, message: "This method is unavailable")
    open override func loadView() {
        // Replace view with gridView
        super.view = gridView
    }
    
}
