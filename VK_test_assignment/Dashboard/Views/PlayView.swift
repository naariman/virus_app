//
//  PlayView.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit


final class PlayView: VKView {
    private struct Constants {
        static let virusView = AppImage.virus.uiImage
        static let playImage = AppImage.play.uiImage
        static let stopImage = AppImage.stop.uiImage
    }
    
    private let virusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.virusView ?? UIImage()
        imageView.clipsToBounds = false
        return imageView
    }()
    
    var buttonDidTap: (() -> ())?
    
    override init(
        backgroundColor: UIColor = .white,
        cornerRadius: CGFloat = 0,
        borderColor: UIColor = .clear,
        borderWidth: CGFloat = 0, maskToBounds: Bool = true
    ) {
        super.init(
            backgroundColor: backgroundColor, 
            cornerRadius: cornerRadius,
            borderColor: borderColor,
            borderWidth: borderWidth
        )
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PlayView {
    func setupUI() {
        clipsToBounds = false
        layer.cornerRadius = 38
        layer.maskedCorners = [.layerMaxXMinYCorner]
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.txt.cgColor
        addSubviews(virusImageView)
        virusImageView.snp.makeConstraints { make in
            make.leading.equalTo(48)
            make.centerY.equalTo(self.snp.top)
            make.size.equalTo(48)
        }
        Animations.rotateViewWithPulse(virusImageView)
    }
    
    func configureData() {
        
    }
}
