//
//  ZoomButtonsView.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

final class ZoomButtonsView: UIView {
    
    private let containerView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private let zoomInView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    private let zoomOutView: UIView = {
        let view = UIView()
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
        button.addTarget(self, action: #selector(zoomInButtonDidTap), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    lazy private var zoomOutButton: UIButton = {
        let button = UIButton()
        button.setImage(.zoomOut, for: .normal)
        button.addTarget(self, action: #selector(zoomOutButtonDidTap), for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.cornerRadius = .pi / 2
        return button
    }()
    
    var zoomInButtonTap: (() -> ())?
    var zoomOutButtonTap: (() -> ())?
    
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
    }
    
    @objc
    private func zoomInButtonDidTap() {
        zoomInButtonTap?()
    }
    
    @objc
    private func zoomOutButtonDidTap() {
        zoomOutButtonTap?()
    }
}
