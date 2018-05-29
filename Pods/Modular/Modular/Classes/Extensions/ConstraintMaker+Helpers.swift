//
//  ConstraintMaker+Helpers.swift
//  Modular
//
//  Created by Ondrej Rafaj on 28/05/2018.
//  Copyright © 2018 manGoweb UK. All rights reserved.
//

@_exported import CoreGraphics
@_exported import SnapKit


extension SnapKit.ConstraintMaker {
    
    /// Set top if value not nil
    public func set(top value: CGFloat?) {
        if let value = value {
            top.equalToSuperview().offset(value)
        }
    }
    
    /// Set left if value not nil
    public func set(left value: CGFloat?) {
        if let value = value {
            left.equalToSuperview().offset(value)
        }
    }
    
    /// Set right if value not nil
    public func set(right value: CGFloat?) {
        if let value = value {
            right.equalToSuperview().offset(value)
        }
    }
    
    /// Set bottom if value not nil
    public func set(bottom value: CGFloat?) {
        if let value = value {
            bottom.equalToSuperview().offset(value)
        }
    }
    
    /// Set width and height if not nil
    public func set(width w: CGFloat? = nil, height h: CGFloat? = nil) {
        if let h = h {
            height.equalTo(h)
        }
        if let w = w {
            width.equalTo(w)
        }
    }
    
}
