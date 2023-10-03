//
//  DescriptionPokemonPresenter.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 3.10.23.
//

import Foundation

protocol DescriptionPokemonViewProtocol: AnyObject {
    func setPokemon(pokemon: MainPokemonData?)
}

protocol DescriptionPokemonPresenterProtocol: AnyObject {
    init(view: DescriptionPokemonViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, pokemon: MainPokemonData?)
    func setPokemon()
    func tap()
}

class DescriptionPokemonPresenter: DescriptionPokemonPresenterProtocol {
    weak var view: DescriptionPokemonViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol
    var pokemon: MainPokemonData?
    
    required init(view: DescriptionPokemonViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, pokemon: MainPokemonData?) {
        self.view = view
        self.router = router
        self.networkService = networkService
        self.pokemon = pokemon
    }
    
    func tap() {
        router?.popToRoot()
    }
    
    public func setPokemon() {
        self.view?.setPokemon(pokemon: pokemon)
    }
}
