//
//  GridCollectionReusableView.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 20/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

#if os(iOS) || os(tvOS)
@_exported import Foundation
@_exported import UIKit
@_exported import SnapKit


/// Grid view enabled collection reusable view
open class GridCollectionReusableView: UICollectionReusableView {
    
    /// Grid view
    public let gridView = GridView()
    
    // MARK: Initialization
    
    /// Initializer
    override public init(frame rect: CGRect) {
        super.init(frame: rect)
        
        addSubview(gridView)
        gridView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @available(*, unavailable, message: "This method is unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

#endif
