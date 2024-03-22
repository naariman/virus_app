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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(entity: EntityViewModel) {
        imageView.image = entity.icon
    }
}

private extension GeneralCell {
    func setupUI() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(48)
        }
    }
}

extension GeneralCell {
    func selected() {
        
    }
}
