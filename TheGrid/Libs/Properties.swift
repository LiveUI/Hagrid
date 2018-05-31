//
//  Properties.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import SnapKit


/// Element properties
public struct Properties {
    
    /// Vertical positioning
    public let vertical: Vertical?
    
    /// Starting position
    public let from: Position
    
    /// Horizontal space taken by the element
    public let space: Position
    
    /// Redraw SnapKit closure
    let redraw: ((_ make: ConstraintMaker) -> Void)?
    
    /// View padding
    let padding: Padding
    
}
