//
//  UIView+Extension.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

public extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
