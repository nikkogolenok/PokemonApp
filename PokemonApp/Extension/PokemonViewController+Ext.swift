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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.indentifier, for: indexPath) as? PokemonCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let pokemonDescriptionViewController = PokemonDescriptionViewController()
        navigationController?.pushViewController(pokemonDescriptionViewController, animated: true)
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
