//
//  PokemonTableViewCell.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 4.10.23.
//

import UIKit
import SnapKit

final class PokemonTableViewCell: UITableViewCell {
    
    // MARK: - Variable
    static let indentifier = "PokemonTableViewCell"
    
    // MARK: - GUI Variables
    let pokemonNameLabel = CustomFactoryElements.createLabel()
    
    // MARK: - View Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(pokemonNameLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // MARK: - Method create constraints
    private func setConstraints() {
        pokemonNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.leading.equalTo(contentView).offset(20)
        }
    }
}
