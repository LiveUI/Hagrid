//
//  GridScrollViewController.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 31/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

#if os(iOS) || os(tvOS)
@_exported import Foundation


/// Grid view view controller
open class GridScrollViewController: UIViewController {
    
    /**
     Grid scroll view
     
     - important: Replaces default `view`
     */
    public internal(set) var gridView: GridScrollView!
    
    /// Scrolling direction
    var scrollingDirection: GridScrollView.Direction
    
    /// Original view (removed)
    @available(*, unavailable, message: "This property is unavailable", renamed: "gridView")
    open override var view: ViewAlias! {
        get { return super.view }
        set { super.view = newValue }
    }
    
    // MARK: View lifecycle
    
    @available(*, unavailable, message: "This method is unavailable")
    open override func loadView() {
        // Replacing view with gridView
        gridView = GridScrollView(scrollingDirection: scrollingDirection)
        super.view = gridView
    }
    
    // MARK: Initialization
    
    /// Initializer
    public init() {
        self.scrollingDirection = .vertical
        
        super.init(nibName: nil, bundle: nil)
    }
    
    /// Initializer (scrolling direction set to `.vertical` by default)
    public init(scrollingDirection: GridScrollView.Direction = .vertical) {
        self.scrollingDirection = scrollingDirection
        
        super.init(nibName: nil, bundle: nil)
    }
    
    /// Initializer (scrolling direction set to `.vertical` by default)
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.scrollingDirection = .vertical
            
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable, message: "This method is unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

#endif
