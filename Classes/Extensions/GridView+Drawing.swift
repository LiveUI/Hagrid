//
//  GridView+Drawing.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
#if os(iOS) || os(tvOS)
@_exported import UIKit
#elseif os(OSX)
@_exported import Cocoa
#endif


extension GridView {
    
    /// Draw rect
    open override func draw(_ rect: CGRect) {
        drawGrid(on: rect)
    }
    
    /// Draw grid view if needed
    func drawGrid(on rect: CGRect) {
        if config.displayGrid {
            // Get the right color co the views background color
            let color = (((backgroundColor ?? .white).isDark ? .white : .black) as UIColor).withAlphaComponent(0.1)
            
            // Draw vertical lines
            for i in 0...config.numberOfColumns {
                let x = self.x(i)
                let bezierPath = UIBezierPath()
                bezierPath.move(to: CGPoint(x: x, y: config.padding.value.top))
                bezierPath.addLine(to: CGPoint(x: x, y: bounds.size.height))
                color.setStroke()
                bezierPath.lineWidth = 1
                bezierPath.stroke()
                
                if i > 0 && i <= config.numberOfColumns {
                    drawColumnNumber(in: i, color: color)
                }
            }
        }
    }
    
    func drawColumnNumber(in column: Int, color: UIColor) {
        let context = UIGraphicsGetCurrentContext()!
        
        let x = self.x((column - 1))
        let font = (config.columnWidth > 20) ? UIFont.boldSystemFont(ofSize: (config.columnWidth / 2)) : UIFont.systemFont(ofSize: (config.columnWidth / 2))
        
        if bounds.size.height < 200 {
            let y = ((bounds.size.height / 2) - (font.pointSize / 2))
            drawColumnNumber(at: y, column: column, x: x, font: font, color: color, context: context)
        } else {
            var y: CGFloat = 100
            while y < bounds.size.height {
                drawColumnNumber(at: y, column: column, x: x, font: font, color: color, context: context)
                y += 100
            }
        }
    }
    
    func drawColumnNumber(at y: CGFloat, column: Int, x: CGFloat, font: UIFont, color: UIColor, context: CGContext) {
        let textRect = CGRect(x: x, y: y, width: config.columnWidth, height: 44)
        let textTextContent = String(column)
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        let textFontAttributes = [
            .font: font,
            .foregroundColor: color,
            .paragraphStyle: textStyle,
            ] as [NSAttributedStringKey: Any]
        
        let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: textRect)
        textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
        context.restoreGState()
    }
    
}
