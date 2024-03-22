//
//  UIColor+Extension.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

public extension UIColor {
    
    static var txt: UIColor {
        return UIColor(hex: 0x384046)
    }
    
    static var _8D8F8F: UIColor {
        return UIColor(hex: 0x8D8F8F)
    }
    
    convenience init(hex: UInt) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb).uppercased()
    }
    
    func components() -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        guard let c = cgColor.components else { return (0, 0, 0, 1) }
        if cgColor.numberOfComponents == 2 {
            return (c[0], c[0], c[0], c[1])
        } else {
            return (c[0], c[1], c[2], c[3])
        }
    }
    
    static func interpolate(from: UIColor, to: UIColor, with fraction: CGFloat) -> UIColor {
        let f = min(1, max(0, fraction))
        let c1 = from.components()
        let c2 = to.components()
        let r = c1.0 + (c2.0 - c1.0) * f
        let g = c1.1 + (c2.1 - c1.1) * f
        let b = c1.2 + (c2.2 - c1.2) * f
        let a = c1.3 + (c2.3 - c1.3) * f
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    static func hexStringToUIColor(hex: String?) -> UIColor {
        guard let hex = hex else { return .gray }
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.removeFirst()
        }

        if cString.count != 6 {
            return UIColor.gray // Return gray color for invalid input
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        let r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgbValue & 0x0000FF) / 255.0

        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

