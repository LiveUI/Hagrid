//
//  GridTableViewHeaderFooterView.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 11/06/2018.
//

#if os(iOS) || os(tvOS)
@_exported import Foundation
@_exported import UIKit
@_exported import SnapKit


open class GridTableViewHeaderFooterView: UITableViewHeaderFooterView {

    /// Grid view
    public let gridView = GridView()
    
    // MARK: Initialization
    
    /// Initializer
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
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
