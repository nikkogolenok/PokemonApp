//
//  PokemonViewController+Ext.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 1.10.23.
//

import UIKit

extension PokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.indentifier, for: indexPath) as? PokemonCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    
}
