//
//  MainPokemonPresenter.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 3.10.23.
//

import Foundation

protocol PokemonViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol PokemonViewPresenterProtocol: AnyObject {
    init(view: PokemonViewProtocol, networkSerview: NetworkServiceProtocol, router: RouterProtocol)
    func getPokemons()
    var pokemons: [PokemonResult] { get set }
    func tapOnThePokemon(pokemon: PokemonResult)
}

final class MainPokemonPresenter: PokemonViewPresenterProtocol {
    weak var view: PokemonViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol
    var pokemons: [PokemonResult] = []
    
    required init(view: PokemonViewProtocol, networkSerview: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkSerview
        self.router = router
        getPokemons()
    }
    
    func tapOnThePokemon(pokemon: PokemonResult) {
        router?.showDecription(pokemon: pokemon)
    }
    
    func getPokemons() {
        networkService.getPokemons(offset: pokemons.count) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.pokemons.append(contentsOf: data.results)
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
