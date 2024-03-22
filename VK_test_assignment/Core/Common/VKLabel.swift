//
//  VKLabel.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

final class VKLabel: UILabel {

    init(
        frame: CGRect = .zero,
        text: String = "",
        font: BasicFont,
        size: CGFloat = 16,
        numberOfLines: Int = 0,
        color: UIColor = .black,
        backgroundColor: UIColor = .clear,
        textAlignment: NSTextAlignment = .left
    ) {
        super.init(frame: frame)
        self.text = text
        self.font = UIFont(name: font.fontFamilyName, size: size)
        self.textColor = color
        self.numberOfLines = numberOfLines
        self.backgroundColor = backgroundColor
        self.textAlignment = textAlignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
