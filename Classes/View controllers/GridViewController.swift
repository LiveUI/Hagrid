//
//  GridViewController.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

#if os(iOS) || os(tvOS)
@_exported import Foundation
@_exported import UIKit


/// Grid view view controller
open class GridViewController: UIViewController {
    
    /**
     Grid view
     
     - important: Replaces default `view`
     */
    public internal(set) var gridView: GridView!
    
    /// Original view (removed)
    @available(*, unavailable, message: "This property is unavailable", renamed: "gridView")
    open override var view: ViewAlias! {
        get { return gridView }
        set { }
    }
    
    // MARK: View lifecycle
    
    @available(*, unavailable, message: "This method is unavailable")
    open override func loadView() {
        // Replacing view with gridView
        gridView = GridView()
        super.view = gridView
    }
    
}

#endif
