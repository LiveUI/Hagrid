//
//  GridView.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
#if os(iOS) || os(tvOS)
@_exported import UIKit
#elseif os(OSX)
@_exported import Cocoa
#endif


/// Grid view
open class GridView: ViewAlias, GridViewInterface {
    
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
        
        /**
         View is dynamically extending horizontally with each added element
         */
        open var autoDynamicHorizontally: Bool = false {
            didSet {
                reLayout()
            }
        }
        
        /**
         View is dynamically extending vertically with each added element
         */
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
            #if os(iOS) || os(tvOS)
            element.setNeedsDisplay()
            #elseif os(OSX)
            element.setNeedsDisplay(element.bounds)
            #endif
        }
        
        /// Re-layout
        private func reLayout() {
            if element.superview != nil {
                #if os(iOS) || os(tvOS)
                element.setNeedsLayout()
                element.layoutIfNeeded()
                #elseif os(OSX)
                element.needsLayout = true
                element.macLayout()
                #endif
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
    
    /// Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    /// Initializer
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
}

// MARK: Initialization

extension GridView {
    
    func setup() {
        #if os(iOS) || os(tvOS)
        backgroundColor = .clear
        #endif
    }
    
    /// Initializer
    public convenience init() {
        self.init(frame: CGRect.zero)
    }
    
}

