//
//  Device.swift
//  TheGrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Device
public enum Device {
    
    /// Device orientation
    public enum Orientation: Int {
        
        /// All
        case all
        
        /// Portrait only
        case portrait
        
        /// Landscape only
        case landscape
        
    }
    
    /// iPhone
    case iPhone(Orientation)
    
    /// iPad
    case iPad(Orientation)
    
    /// Apple TV
    case appleTV
    
    /// Mac
    case mac
    
}


extension Device: Hashable {
    
    public var hashValue: Int {
        switch self {
        case .iPhone(let orientation):
            return 100 + orientation.rawValue
        case .iPad(let orientation):
            return 200 + orientation.rawValue
        case .appleTV:
            return 300
        case .mac:
            return 400
        }
    }
    
}

extension Device: Equatable {
    
    public static func ==(lhs: Device, rhs: Device) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
}
