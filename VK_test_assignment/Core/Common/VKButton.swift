//
//  VKButton.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

final class VKButton: UIButton {
    
    init(title: String = "",
         titleColor: UIColor = .clear,
         font: UIFont = .systemFont(ofSize: 16, weight: .semibold),
         cornerRadius: CGFloat = 8,
         borderWidth: CGFloat = 0,
         borderColor: UIColor = .clear,
         backgroundColor: UIColor = .clear,
         contentHorizontalAlignment: UIControl.ContentHorizontalAlignment = .center) {
        super.init(frame: .zero)
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.contentHorizontalAlignment = contentHorizontalAlignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func disable() {
        self.alpha = 0.3
        self.isUserInteractionEnabled = false
    }
    
    func enable() {
        self.alpha = 1
        self.isUserInteractionEnabled = true
    }
}
