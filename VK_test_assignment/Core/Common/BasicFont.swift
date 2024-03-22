//
//  BasicFont.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import Foundation

enum BasicFont {
    case bold
    case regular
    
    var fontFamilyName: String {
        switch self {
        case .bold:
            return "circe-Bold"
        case .regular:
            return "Circe-Regular"
        }
    }
}
