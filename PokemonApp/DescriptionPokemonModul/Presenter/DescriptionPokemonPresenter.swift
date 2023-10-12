//
//  DescriptionPokemonPresenter.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 3.10.23.
//

import Foundation

protocol DescriptionPokemonViewProtocol: AnyObject {
    func setPokemon(pokemon: DescriptionPokemonData)
}

protocol DescriptionPokemonPresenterProtocol: AnyObject {
    init(view: DescriptionPokemonViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, pokemon: PokemonResult)
    func setPokemon()
    func tap()
}

final class DescriptionPokemonPresenter: DescriptionPokemonPresenterProtocol {
    weak var view: DescriptionPokemonViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol
    var pokemon: PokemonResult
    
    required init(view: DescriptionPokemonViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, pokemon: PokemonResult) {
        self.view = view
        self.router = router
        self.networkService = networkService
        self.pokemon = pokemon
    }
    
    func tap() {
        router?.popToRoot()
    }
    
    public func setPokemon() {
        networkService.getPokemonDescription(url: pokemon.url) { [weak self] result in
            switch result {
            case .success(let pokemon):
                DispatchQueue.main.async {
                    self?.view?.setPokemon(pokemon: pokemon)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
