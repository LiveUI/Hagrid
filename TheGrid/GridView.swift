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
open class GridView: UIView {
    
    /// Grid view config object
    public final class Config {
        
        /// Grid view data cache
        public struct Values {
            
            /// Column width
            public var columnWidth: CGFloat = 0
            
        }
        
        /**
         Display grid outlines
         
         - important: Redraws gridview on set
         */
        public var displayGrid: Bool = false { didSet { redraw() } }
        
        /**
         Number of columns
         
         - important: Redraws gridview on set
         */
        public var numberOfColumns: Int = 12 {
            didSet {
                element.setNeedsLayout()
                element.layoutIfNeeded()
            }
        }
        
        // MARK: Private interface
        
        /// Cached values
        public internal(set) var values = Values()
        
        /// Holds reference to the grid view
        let element: GridView
        
        /// Initializer
        init(_ element: GridView) {
            self.element = element
        }
        
        /// Re-draw the element
        func redraw() {
            element.setNeedsDisplay()
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

