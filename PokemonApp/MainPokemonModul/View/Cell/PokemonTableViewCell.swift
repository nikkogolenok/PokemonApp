//
//  PokemonTableViewCell.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 4.10.23.
//

import UIKit
import SnapKit

class PokemonTableViewCell: UITableViewCell {
    
    // MARK: - Variable
    static let indentifier = "PokemonTableViewCell"
    
    // MARK: - GUI Variables
    let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        
        return label
    }()
    
    // MARK: - View Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(pokemonNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }
    
    // MARK: - Method
    func setConstraints() {
        pokemonNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20)
        }
    }
}
