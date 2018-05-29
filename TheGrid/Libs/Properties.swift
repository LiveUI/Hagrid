//
//  Properties.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
@_exported import SnapKit


/// Element properties
public struct Properties {
    
    /// Top margin from the nearest row
    public let top: CGFloat
    
    /// Starting position
    public let pos: Int
    
    /// Horizontal space taken by the element
    public let space: PositionConvertible
    
    /// Redraw SnapKit closure
    let redraw: ((_ make: ConstraintMaker) -> Void)?
    
    /// View padding
    let padding: Padding
    
}
