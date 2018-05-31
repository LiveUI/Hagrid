//
//  GridScrollView.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 31/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import SnapKit


/// GridView enabled scroll view
open class GridScrollView: ViewAlias, GridViewInterface, ScrollViewForwarder {
    
    /// Scrolling direction
    public enum Direction {
        
        /// Vertical
        case vertical
        
    }
    
    /// Main scroll view
    public let scrollView = UIScrollView()
    
    /// Main grid view
    public let gridView = GridView()
    
    /// Scrolling direction
    public internal(set) var scrollingDirection: GridScrollView.Direction
    
    /// Grid view configuration
    open internal(set) var config: GridView.Config {
        get { return gridView.config }
        set { gridView.config = newValue }
    }
    
    /// Subviews
    public internal(set) var gridSubviews: [Subview] {
        get { return gridView.gridSubviews }
        set { gridView.gridSubviews = newValue }
    }
    
    // MARK: Initialization
    
    private func setup(direction: Direction = .vertical) {
        super.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        switch scrollingDirection {
        case .vertical:
            gridView.config.automaticVerticalSizing = true
        }
        scrollView.addSubview(gridView)
        gridView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            if direction == .vertical {
                make.width.equalTo(scrollView)
            }
        }
    }
    
    /// Init with scrolling direction (.vertical by default)
    public init(scrollingDirection: Direction = .vertical) {
        self.scrollingDirection = scrollingDirection
        super.init(frame: .zero)
        setup()
    }
    
    /// Init with frame (defaults to vertical scrolling)
    public override init(frame: CGRect) {
        scrollingDirection = .vertical
        super.init(frame: frame)
        setup()
    }
    
    /// Init with coder (defaults to vertical scrolling)
    required public init?(coder aDecoder: NSCoder) {
        scrollingDirection = .vertical
        super.init(coder: aDecoder)
        setup()
    }
    
}
