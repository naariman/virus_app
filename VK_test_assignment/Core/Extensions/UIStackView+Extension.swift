//
//  UIStackView+Extension.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
