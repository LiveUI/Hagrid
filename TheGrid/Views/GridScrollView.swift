//
//  GridScrollView.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 31/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
@_exported import SnapKit


/// GridView enabled scroll view
open class GridScrollView: UIView, GridViewInterface, ScrollViewForwarder {
    
    /// Scrolling direction
    public enum Direction {
        
        /// Vertical
        case vertical
        
        /// Horizontal
        case horizontal
        
        /// Vertical & horizontal
        case both
        
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
        backgroundColor = .blue
        
        super.addSubview(scrollView)
        scrollView.backgroundColor = .red
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        switch scrollingDirection {
        case .horizontal:
            gridView.config.autoDynamicHorizontally = true
        case .vertical:
            gridView.config.autoDynamicVertically = true
        case .both:
            gridView.config.autoDynamicVertically = true
            gridView.config.autoDynamicHorizontally = true
        }
        scrollView.addSubview(gridView)
        gridView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            if direction == .vertical {
                make.width.equalTo(scrollView)
            } else if direction == .horizontal {
                make.height.equalTo(scrollView)
            }
        }
    }
    
    /// Init with scrolling direction (.vertical by default)
    public init(scrollingDirection: Direction = .vertical) {
        self.scrollingDirection = scrollingDirection
        super.init(frame: .zero)
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
