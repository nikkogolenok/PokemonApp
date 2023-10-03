//
//  PokemonDescriptionViewController.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 2.10.23.
//

import UIKit
import SnapKit

class PokemonDescriptionViewController: UIViewController {
    
    // MARK: - Variables
    var presenter: DescriptionPokemonPresenterProtocol!

    // MARK: - GUI Variables
    let stackImageAndLabel: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .top
        stack.distribution = .fillEqually
        stack.spacing = 5
        
        return stack
    }()
    
    let stackOfStacks: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 50
        
        return stack
    }()
    
    let stackOfLabels: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 50
        
        return stack
    }()
    
    let stackOfValues: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 50
        
        return stack
    }()
    
    let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "clock")
        imageView.contentMode = .center
        
        return imageView
    }()
    
    let pokemonDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bulbasaur can be seen napping in bright sunlight.\nThere is a seed on its back. By soaking up the sun’s rays,\nthe seed grows progressively larger."
        label.textColor = .white
        label.textAlignment = .natural
        label.numberOfLines = 0
        
        return label
    }()
    
    let pokemonTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PokemonType:"
        label.textColor = .white
        
        return label
    }()
    
    let pokemonWeightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PokemonWeight:"
        label.textColor = .white
        
        return label
    }()
    
    let pokemonHeightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PokemonHeight:"
        label.textColor = .white
        
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Type"
        label.textColor = .white
        
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weight"
        label.textColor = .white
        
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Height"
        label.textColor = .white
        
        return label
    }()
    
    let continueBotton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(continueBottonAction), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviewToView()
        setConstraints()
        
        presenter.setPokemon()
    }
    
    // MARK: - Methods
    private func addSubviewToView() {
        view.addSubview(stackImageAndLabel)
        view.addSubview(stackImageAndLabel)
        stackImageAndLabel.addArrangedSubview(pokemonImageView)
        stackImageAndLabel.addArrangedSubview(pokemonDescriptionLabel)
        
        view.addSubview(stackOfStacks)
        stackOfStacks.addArrangedSubview(stackOfLabels)
        stackOfStacks.addArrangedSubview(stackOfValues)
        
        stackOfLabels.addArrangedSubview(pokemonTypeLabel)
        stackOfLabels.addArrangedSubview(pokemonWeightLabel)
        stackOfLabels.addArrangedSubview(pokemonHeightLabel)
        
        stackOfValues.addArrangedSubview(typeLabel)
        stackOfValues.addArrangedSubview(weightLabel)
        stackOfValues.addArrangedSubview(heightLabel)
        
        view.addSubview(continueBotton)
    }
    
    private func setConstraints() {
        stackImageAndLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalTo(5)
            make.trailing.equalTo(5)
        }
        
        stackOfStacks.snp.makeConstraints { make in
            make.top.equalTo(stackImageAndLabel.snp.bottom).offset(100)
            make.centerX.equalTo(self.view.center.x)
        }
        
        continueBotton.snp.makeConstraints { make in
            make.top.equalTo(stackOfStacks.snp.bottom).offset(150)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
    }
    
    // MARK: - Action
    @objc func continueBottonAction(sender: UIButton!) {
        self.presenter.tap()
        print("Tapped")
    }
}
