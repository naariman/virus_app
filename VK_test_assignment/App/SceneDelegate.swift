//
//  SceneDelegate.swift
//  VK Test Assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(
//            rootViewController: DashboardRouter.createModule(
//                with: .init(groupSize: 128,
//                            infectionFactor: 4,
//                            recalculationInfected: 1)
//            )
            rootViewController: DataCollectionRouter.createModule()
        )
        window.makeKeyAndVisible()
        self.window = window
    }
}

