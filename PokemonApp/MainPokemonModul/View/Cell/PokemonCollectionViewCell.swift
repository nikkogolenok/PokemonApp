//
//  PokemonCollectionViewCell.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 1.10.23.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variable
    static let indentifier = "PokemonCollectionViewCell"
    
    // MARK: - GUI Variables
    let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "house")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let pokemonDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "House"
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - View Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(pokemonImageView)
        contentView.addSubview(pokemonDescriptionLabel)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pokemonImageView.frame = CGRect(x: 5,
                                        y: 0,
                                        width: contentView.frame.size.width-10,
                                        height: contentView.frame.size.height-50)
        
        pokemonDescriptionLabel.frame = CGRect(x: 5,
                                               y: contentView.frame.size.height-50,
                                               width: contentView.frame.size.width-10,
                                               height: 50)
    }
}
