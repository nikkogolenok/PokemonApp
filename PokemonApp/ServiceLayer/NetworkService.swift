//
//  NetworkService.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 3.10.23.
//

import Foundation

protocol NetworkServiceProtocol {
    func getPokemons(offset: Int, completion: @escaping (Result<MainPokemonData, Error>) -> Void)
    func getPokemonDescription(url: URL, completion: @escaping (Result<DescriptionPokemonData, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getPokemons(offset: Int, completion: @escaping (Result<MainPokemonData, Error>) -> Void) {
        let urlString = "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=20"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, response != nil else { return }
            print("Success")
            
            do {
                let obj = try JSONDecoder().decode(MainPokemonData.self, from: data)
                completion(.success(obj))
            }
            catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    func getPokemonDescription(url: URL, completion: @escaping (Result<DescriptionPokemonData, Error>) -> Void) {
        //let urlString = "https://pokeapi.co/api/v2/pokemon/%7Bid%7D/"
        //guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { date, response, error in
            guard let date = date, error == nil, response != nil else { return }
            
            do {
                let obj = try JSONDecoder().decode(DescriptionPokemonData.self, from: date)
                completion(.success(obj))
            }
            catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
