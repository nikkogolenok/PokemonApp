//
//  NetworkService.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 3.10.23.
//

import Foundation

struct NetworkError: Error {
    let code: Int
    let description: String
    var message: String {
        "Error: \n\(description)"
    }
}

protocol NetworkServiceProtocol {
    func getPokemons(offset: Int, completion: @escaping (Result<MainPokemonData, NetworkError>) -> Void)
    func getPokemonDescription(url: URL, completion: @escaping (Result<DescriptionPokemonData, NetworkError>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    private let baseURL = "https://pokeapi.co/api/v2"
    
    private func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            let httpResponse = response as? HTTPURLResponse
            let code = httpResponse?.statusCode
            guard let code = code else { return }
            
            if let error = error {
                completion(.failure(NetworkError(code: code, description: error.localizedDescription)))
                return
            }
            
            guard let response = httpResponse, 200...299 ~= response.statusCode else {
                completion(.failure(NetworkError(code: code, description: "Something went wrong")))
                return
            }
            
            if let data = data {
                do {
                    let obj = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(obj))
                } catch {
                    completion(.failure(NetworkError(code: code, description: "Error parsing data")))
                }
            } else {
                completion(.failure(NetworkError(code: code, description: "No data received")))
            }
        }
        .resume()
    }
    
    func getPokemons(offset: Int, completion: @escaping (Result<MainPokemonData, NetworkError>) -> Void) {
        let urlString = baseURL + "/pokemon?offset=\(offset)&limit=20"
        guard let url = URL(string: urlString) else { return }
        fetchData(url: url, completion: completion)
    }
    
    func getPokemonDescription(url: URL, completion: @escaping (Result<DescriptionPokemonData, NetworkError>) -> Void) {
        fetchData(url: url, completion: completion)
    }
}
