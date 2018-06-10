//
//  GridTableViewCell.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 01/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

#if os(iOS) || os(tvOS)
@_exported import Foundation
@_exported import UIKit
@_exported import SnapKit


/// Grid view enabled table view cell
class GridTableViewCell: UITableViewCell {

    /// Grid view
    public let gridView = GridView()
    
    @available(*, unavailable, message: "This method is unavailable", renamed: "gridView")
    override var contentView: UIView {
        get { return super.contentView }
    }
    
    // MARK: Initialization
    
    /// Initializer
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        super.contentView.addSubview(gridView)
        gridView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @available(*, unavailable, message: "This method is unavailable")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

#endif
