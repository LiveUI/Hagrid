//
//  GridView.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
@_exported import UIKit


/// Grid view
open class GridView: UIView, GridViewInterface {
    
    /// Grid view config object
    public final class Config {
        
        /**
         Display grid outlines
         
         - important: Redraws gridview on set
         */
        public var displayGrid: Bool = false { didSet { reDraw() } }
        
        /**
         Number of columns
         
         - important: Redraws gridview on set
         */
        public var numberOfColumns: Int = 12 { didSet { reLayout() } }
        
        /**
         Column width
         
         - important: Will be 0 until grid view is drawn for the first time
         */
        public internal(set) var columnWidth: CGFloat = 0
        
        /**
         Grid view padding
         
         - important: Bottom padding not implemented
         */
        public var padding: Padding = .none {
            didSet {
                reLayout()
            }
        }
        
        /// View is dynamically extending horizontally
        open var autoDynamicHorizontally: Bool = false {
            didSet {
                reLayout()
            }
        }
        
        /// View is dynamically extending vertically
        open var autoDynamicVertically: Bool = false {
            didSet {
                reLayout()
            }
        }
        
        // MARK: Private interface
        
        /// Holds reference to the grid view
        let element: GridView
        
        /// Initializer
        init(_ element: GridView) {
            self.element = element
        }
        
        /// Re-draw the element
        func reDraw() {
            element.setNeedsDisplay()
        }
        
        /// Re-layout
        private func reLayout() {
            if element.superview != nil {
                element.setNeedsLayout()
                element.layoutIfNeeded()
            }
        }
        
    }
    
    /// Grid view configuration
    open internal(set) lazy var config: Config = {
        return Config(self)
    }()
    
    /// Subviews
    public internal(set) var gridSubviews: [Subview] = []
    
    // MARK: Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
}

// MARK: Initialization

extension GridView {
    
    func setup() {
        backgroundColor = .clear
    }
    
    public convenience init() {
        self.init(frame: CGRect.zero)
    }
    
}

