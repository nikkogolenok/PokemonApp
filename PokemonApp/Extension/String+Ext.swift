//
//  String+Ext.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 16.10.23.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
