//
//  MainPokemonData.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 3.10.23.
//

import Foundation

// MARK: - MainPokemonData
struct MainPokemonData: Codable {
    let count: Int
    let next:  URL?
    let prev:  URL?
    let results: [PokemonResult]
    
    private enum COdingKey: String, CodingKey {
        case count, next, prev = "previous", results
    }
}

// MARK: - PokemonResult
struct PokemonResult: Codable {
    let name: String
    let url:  URL
}
