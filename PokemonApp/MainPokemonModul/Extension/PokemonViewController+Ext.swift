//
//  PokemonViewController+Ext.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 1.10.23.
//

import UIKit

// MARK: - PokemonViewController: UITableViewDelegate
extension PokemonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = presenter.pokemons[indexPath.row]
        presenter.tapOnThePokemon(pokemon: pokemon)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height)) {
            self.presenter.getPokemons()
        }
    }
}

// MARK: - PokemonViewController: UITableViewDataSource
extension PokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.indentifier, for: indexPath) as? PokemonTableViewCell else { return UITableViewCell() }
        let pokemon = presenter.pokemons[indexPath.row]
        cell.pokemonNameLabel.text = pokemon.name
        return cell
    }
}

// MARK: - PokemonViewController: PokemonViewProtocol 
extension PokemonViewController: PokemonViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    func showAlert(message: String, completion: (() -> Void)?) {
        let alertController = UIAlertController(title: "Network error", message: message, preferredStyle: .alert)
        let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAlert)
        self.present(alertController, animated: true)
    }
}
