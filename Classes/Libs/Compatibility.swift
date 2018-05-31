//
//  Compatibility.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 31/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)

@_exported import UIKit

public typealias ViewAlias = UIView

#elseif os(OSX)

@_exported import Cocoa

public typealias ViewAlias = NSView

#endif
