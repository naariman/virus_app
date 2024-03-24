//
//  ZoomButtonsView.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

protocol ZoomButtonsViewDelegate: AnyObject {
    func zoomInDidTap()
    func zoomOutDidTap()
}

final class ZoomButtonsView: UIView {
    weak var delegate: ZoomButtonsViewDelegate?
    
    private let containerView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private let zoomInView: VKView = {
        let view = VKView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    private let zoomOutView: VKView = {
        let view = VKView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    lazy private var zoomInButton: UIButton = {
        let button = UIButton()
        button.setImage(.zoomIn, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    lazy private var zoomOutButton: UIButton = {
        let button = UIButton()
        button.setImage(.zoomOut, for: .normal)
        button.backgroundColor = .white
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        zoomInView.addSubview(zoomInButton)
        zoomInView.snp.makeConstraints { make in
            make.size.equalTo(48)
        }
        
        zoomOutView.addSubview(zoomOutButton)
        zoomOutView.snp.makeConstraints { make in
            make.size.equalTo(48)
        }
        
        zoomInButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(32)
        }
        zoomOutButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(32)
        }
        
        containerView.addArrangedSubviews(
            zoomInView,
            zoomOutView
        )
        let zoomInLong = UILongPressGestureRecognizer(target: self, action: #selector(zoomIn))
        let zoomOutLong = UILongPressGestureRecognizer(target: self, action: #selector(zoomOut))
        zoomInButton.addGestureRecognizer(zoomInLong)
        zoomOutButton.addGestureRecognizer(zoomOutLong)
    }
    
    @objc private func zoomOut(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state != .ended {
            delegate?.zoomOutDidTap()
        }
    }
    
    @objc private func zoomIn(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state != .ended {
            delegate?.zoomInDidTap()
        }
    }
    
}
