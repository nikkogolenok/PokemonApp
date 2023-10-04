//
//  PokemonViewController+Ext.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 1.10.23.
//

import UIKit

// MARK: - PokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource
extension PokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.indentifier, for: indexPath) as? PokemonCollectionViewCell else { return UICollectionViewCell() }
        
        let pokemon = presenter.pokemons[indexPath.row]
        let urlPokemon = pokemon.url
        
        cell.pokemonImageView.downloaded(from: urlPokemon)
        cell.pokemonDescriptionLabel.text = pokemon.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemon = presenter.pokemons[indexPath.row]
        presenter.tapOnThePokemon(pokemon: pokemon)
    }
}

// MARK: - PokemonViewController: PokemonViewProtocol 
extension PokemonViewController: PokemonViewProtocol {
    func success() {
        collectionView?.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
