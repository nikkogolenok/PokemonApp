//
//  PokemonDescriptionViewController+Ext.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 3.10.23.
//

import UIKit

// MARK: - PokemonDescriptionViewController: DescriptionPokemonViewProtocol 
extension PokemonDescriptionViewController: DescriptionPokemonViewProtocol {
    func setPokemon(pokemon: DescriptionPokemonData) {
        
        pokemonImageView.downloaded(from: pokemon.sprites.frontDefaultImageURL)
        pokemonDescriptionLabel.text = ""
        nameLabel.text = pokemon.name
        typeLabel.text = pokemon.types.map({ $0.type.name }).joined(separator: ", ")
        weightLabel.text = String(pokemon.weight)
        heightLabel.text = String(pokemon.height)
    }
}
