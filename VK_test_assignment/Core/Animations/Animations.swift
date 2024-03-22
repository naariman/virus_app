//
//  Animations.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

final class Animations {
    
    static func rotateViewWithPulse(_ view: UIView) {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = CGFloat.pi * 2
        rotationAnimation.duration = 6
        rotationAnimation.repeatCount = .infinity
        
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.fromValue = 1
        pulseAnimation.toValue = 1.1
        pulseAnimation.duration = 1
        pulseAnimation.autoreverses = true
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [rotationAnimation, pulseAnimation]
        animationGroup.duration = 3
        animationGroup.repeatCount = .infinity
        
        view.layer.add(animationGroup, forKey: "rotationAndPulse")
    }
    
}
