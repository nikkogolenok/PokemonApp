//
//  DescriptionPokemonData.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 3.10.23.
//

import Foundation

// MARK: - DescriptionPokemonData
struct DescriptionPokemonData: Codable {
    let name:   String?
    let height: Int?
    let weight: Int?
    let sprites: Sprites?
    let types:   [PokemonType]?
}

// MARK: - Sprites
struct Sprites: Codable {
    let frontDefaultImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefaultImageURL = "front_default"
    }
}

// MARK: - PokemonType
struct PokemonType: Codable {
    let type: PokemonNames
}

// MARK: - PokemonNames
struct PokemonNames: Codable {
    let name: String
}
