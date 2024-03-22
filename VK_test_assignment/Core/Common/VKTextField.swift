//
//  VKTextField.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

final class VKTextField: UIView {
    
    private let textField: UITextField = {
      let textField = UITextField()
        return textField
    }()
    
    private var placeholderText: String?
    
    init(
        placeholderText: String?
    ) {
        super.init(frame: .zero)
        self.placeholderText = placeholderText
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension VKTextField {
    func setup() {
        textField.placeholder = placeholderText
    }
}
