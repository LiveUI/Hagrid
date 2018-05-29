//
//  Array+StackView.swift
//  Modular
//
//  Created by Ondrej Rafaj on 03/12/2017.
//

import Foundation
#if os(iOS) || os(tvOS)
    @_exported import UIKit
#endif


#if os(iOS) || os(tvOS)
    
    extension Array where Element: ViewAlias {
        
        /// Modular make property
        public var make: Make<[ViewAlias]> {
            return Make<[ViewAlias]>(self)
        }
        
    }
    
    
    extension Make where T == [ViewAlias] {
        
        /**
         Create horizontal stack view from an array of views
         
         - parameters:
            - distribution: `UIStackViewDistribution` (default `.equalSpacing`)
            - alignment: `UIStackViewAlignment` (default `.leading`)
         - returns: `UIStackView`
         */
        public func horizontalStackView(distribution: UIStackViewDistribution = .equalSpacing, alignment: UIStackViewAlignment = .leading) -> UIStackView {
            let stackView = UIStackView(arrangedSubviews: element)
            stackView.axis = .horizontal
            stackView.distribution = distribution
            stackView.alignment = alignment
            return stackView
        }
        
        /**
         Create vertical stack view from an array of views
         
         - parameters:
            - distribution: `UIStackViewDistribution` (default `.equalSpacing`)
            - alignment: `UIStackViewAlignment` (default `.leading`)
         - returns: `UIStackView`
         */
        public func verticalStackView(distribution: UIStackViewDistribution = .equalSpacing, alignment: UIStackViewAlignment = .leading) -> UIStackView {
            let stackView = UIStackView(arrangedSubviews: element)
            stackView.axis = .vertical
            stackView.distribution = distribution
            stackView.alignment = alignment
            return stackView
        }
        
    }
    
#endif
