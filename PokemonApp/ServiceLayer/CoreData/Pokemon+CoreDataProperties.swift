//
//  Pokemon+CoreDataProperties.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 16.10.23.
//
//

import Foundation
import CoreData


extension Pokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
        return NSFetchRequest<Pokemon>(entityName: "Pokemon")
    }

    @NSManaged public var pokemonName: String?
    @NSManaged public var pokemonType: String?
    @NSManaged public var pokemonWeight: Int16
    @NSManaged public var pokemonHeight: Int16
    @NSManaged public var pokemonImage: URL?

}

extension Pokemon : Identifiable {

}
