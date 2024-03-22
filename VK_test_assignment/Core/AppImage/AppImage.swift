//
//  AppImage.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

public protocol AppImageProtocol {
    var rawValue: String { get }
}

public extension AppImageProtocol {
    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
}

public enum AppImage: String, 
                      AppImageProtocol {
    case zombie
    case human
    case time
    case play
    case stop
    case virus
}
