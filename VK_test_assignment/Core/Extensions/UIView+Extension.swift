//
//  UIView+Extension.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

public extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

public extension UIView {
    func rotateInfinitely(duration: TimeInterval = 1.0) {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = CGFloat.pi * 2.0
        rotationAnimation.duration = duration
        rotationAnimation.repeatCount = .greatestFiniteMagnitude
        self.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
}

public extension UIView {
    func addShadow(
        ofColor color: UIColor,
        radius: CGFloat,
        offset: CGSize,
        opacity: Float
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}

