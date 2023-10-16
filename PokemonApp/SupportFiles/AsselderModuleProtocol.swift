//
//  AsselderModulaProtocol.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 3.10.23.
//

import UIKit

protocol AsselderBuilberProtocol {
    func createMainPokemonModule(router: RouterProtocol) -> UIViewController
    func createDescriptionPokemonModule(pokemon: PokemonResult, router: RouterProtocol) -> UIViewController
}

final class AsselderModuleBuilder: AsselderBuilberProtocol {
    func createMainPokemonModule(router: RouterProtocol) -> UIViewController {
        let view = PokemonViewController()
        let networkService = NetworkService()
        let presenter = MainPokemonPresenter(view: view, networkSerview: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDescriptionPokemonModule(pokemon: PokemonResult, router: RouterProtocol) -> UIViewController {
        let view = PokemonDescriptionViewController()
        let networkService = NetworkService()
        let presenter = DescriptionPokemonPresenter(view: view, networkService: networkService, router: router, pokemon: pokemon)
        view.presenter = presenter
        return view
    }
}
