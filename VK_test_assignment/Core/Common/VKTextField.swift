//
//  VKTextField.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit
import SnapKit

final class VKTextField: UIView {
    
    private enum Style {
        static let borderColor: UIColor = ._8D8F8F
    }
    
    lazy private var titleLabel: VKLabel = .init(
        font: .systemFont(ofSize: 14, weight: .bold)
    )
    
    lazy private var borderView: VKView = .init(
        backgroundColor: .clear,
        cornerRadius: 8,
        borderColor: Style.borderColor,
        borderWidth: 0.5
    )
    
    lazy private var textField = UITextField()
    var textFieldTextChanged: ((String) -> Void)?
    
    init(
        title: String,
        keyboardType: UIKeyboardType = .default
    ) {
        super.init(frame: .zero)
        titleLabel.text = title
        textField.keyboardType = keyboardType
        setup()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlaceholder(_ text: String) {
        textField.placeholder = text
    }
}

//MARK: - SetupUI
private extension VKTextField {
    func setup() {
        addSubviews(
            titleLabel,
            borderView
        )
        borderView.addSubviews(
            textField
        )
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        borderView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(42)
            make.bottom.equalToSuperview()
        }
        
        textField.snp.makeConstraints {
               $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
        
        textField.addTarget(
            self,
            action: #selector(didChangeText),
            for: .editingChanged
        )
    }
    
    func setupViews() {
        textField.becomeFirstResponder()
        textField.textAlignment = .center
        textField.tintColor = .clear
        textField.delegate = self
        textField.font = .systemFont(ofSize: 14, weight: .semibold)
        borderView.layer.shadowColor = UIColor.txt.cgColor
        borderView.layer.shadowOffset = CGSize(width: 0, height: 2)
        borderView.layer.shadowOpacity = 0.2
        borderView.layer.shadowRadius = 12
    }
}

//MARK: - Actions
private extension VKTextField {
    @objc func didChangeText(textField: UITextField) {
        textFieldTextChanged?(textField.text ?? "")
    }
}

extension VKTextField: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
           let allowedCharacters = CharacterSet.decimalDigits
           let characterSet = CharacterSet(charactersIn: string)
           return allowedCharacters.isSuperset(of: characterSet)
       }
}
