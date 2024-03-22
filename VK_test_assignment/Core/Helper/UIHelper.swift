//
//  UIHelper.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

struct UIHelper {
    public static func setRoot(
        _ viewController: UIViewController?
    ) {
        guard let window = UIApplication.shared.windows.filter(
            { $0.isKeyWindow }).first else {
            return
        }
        guard let vc = viewController else {
            return
        }
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            let oldState: Bool = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            window.rootViewController = vc
            window.makeKeyAndVisible()
            UIView.setAnimationsEnabled(oldState)
        }, completion: nil)
    }
}
