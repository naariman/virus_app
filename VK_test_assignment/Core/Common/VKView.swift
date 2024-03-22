//
//  VKView.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

final class VKView: UIView {

    init(backgroundColor: UIColor = .white,
         cornerRadius: CGFloat = 0,
         borderColor: UIColor = .clear,
         borderWidth: CGFloat = 0,
         maskToBounds: Bool = true) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = maskToBounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
