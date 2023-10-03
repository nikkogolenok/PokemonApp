//
//  Router.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 3.10.23.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AsselderBuilberProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initalViewController()
    func showDecription(pokemon: MainPokemonData?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AsselderBuilberProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AsselderBuilberProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initalViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainPokemonModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDecription(pokemon: MainPokemonData?) {
        if let navigationController = navigationController {
            guard let descriptionViewController = assemblyBuilder?.createDescriptionPokemonModule(pokemon: pokemon, router: self) else { return }
            navigationController.pushViewController(descriptionViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
