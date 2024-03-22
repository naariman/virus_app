//
//  ZoomButtonsView.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

final class ZoomButtonsView: UIView {
    
    lazy private var zoomInButton: UIButton = {
        let button = UIButton()
//        button.addTarget(self, action: #selector(), for: .press)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
