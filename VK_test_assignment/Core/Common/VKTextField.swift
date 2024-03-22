//
//  VKTextField.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

final class VKTextField: UIView {
    
    private enum Style {
        static let borderColor: UIColor = ._8D8F8F
    }
    
    private let titleLabel: VKLabel = .init(
        font: .bold,
        size: 14
    )
    private let borderView: VKView = .init(
        backgroundColor: .clear,
        cornerRadius: 8,
        borderColor: Style.borderColor
    )
    private let textField = UITextField()
    var textFieldTextChanged: ((String) -> Void)?

    private var placeholderText: String?
    
    init(
        title: String,
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
