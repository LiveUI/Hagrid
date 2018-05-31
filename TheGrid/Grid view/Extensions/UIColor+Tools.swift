//
//  UIColor+Tools.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


extension UIColor {
    
    /// Is color dark?
    var isDark: Bool {
        let rgb = rgba()
        if rgb[3] < 0.2 {
            return false
        }
        return (0.2126 * rgb[0] + 0.7152 * rgb[1] + 0.0722 * rgb[2]) < 0.5
    }
    
    /// GRB components
    func rgba() -> [CGFloat] {
        var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return [r, g, b, a]
    }
    
}
