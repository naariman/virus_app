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
    
    private var progressView: UIProgressView = {
        var view = UIProgressView()
        view.progressTintColor = ._7faa55
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
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
    
    func updateProgress(_ progress: Float) {
        progressView.setProgress(progress, animated: true)
    }
}

private extension PlayView {
    func setupUI() {
        clipsToBounds = false
        layer.cornerRadius = 38
        layer.maskedCorners = [.layerMaxXMinYCorner]
        layer.borderColor = UIColor.txt.cgColor
        addSubviews(
            virusImageView,
            progressView
        )
        virusImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(16)
            make.size.equalTo(54)
        }
        
        progressView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(16)
            make.leading.equalTo(virusImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(32)
        }
        Animations.rotateViewWithPulse(virusImageView)
    }
}
