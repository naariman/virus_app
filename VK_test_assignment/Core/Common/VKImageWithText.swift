//
//  VKImageWithText.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

final class ImageWithTextHorizontal: UIView {
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let textLabel: VKLabel = .init(
        font: .systemFont(
            ofSize: 14,
            weight: .semibold
        )
    )
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(
    ) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: UIImage, text: String) {
        imageView.image = image
        textLabel.text = text
    }
    
    func updateText(with text: String) {
        textLabel.text = text
    }
}

private extension ImageWithTextHorizontal {
    func setupUI() {
        addSubviews(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(32)
        }
        
        mainStackView.addArrangedSubviews(
            imageView,
            textLabel
        )
    }
}

