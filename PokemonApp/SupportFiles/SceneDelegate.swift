//
//  SceneDelegate.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 1.10.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Variable
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let navigationController = UINavigationController()
        let assemblyBuilber = AsselderModuleBuilder()
        let router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilber)
        router.initalViewController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

