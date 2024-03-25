//
//  GeneralCell.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

final class GeneralCell: UICollectionViewCell,
                         ReusableView  {
    
    private struct Constants {
        static let human = AppImage.human.uiImage
        static let zombie = AppImage.zombie.uiImage
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.human
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ bool: Bool) {
        imageView.image = bool ? AppImage.zombie.uiImage ?? UIImage() : AppImage.human.uiImage ?? UIImage()
    }
}

private extension GeneralCell {
    func setupUI() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.size.equalTo(32)
        }
    }
}
