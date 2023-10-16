//
//  PokemonDescriptionViewController.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 2.10.23.
//

import UIKit
import SnapKit

enum ConstantsOfConstraints: CGFloat, ConstraintOffsetTarget {
    case pokemonImageViewTop = 30
    case stackOfStacksTop = 100
    case continueBottonTop = 150
    case continueBottonWight = 250
    case continueBottonHeight = 50
}

final class PokemonDescriptionViewController: UIViewController {
    
    // MARK: - Variables
    var presenter: DescriptionPokemonPresenterProtocol!

    // MARK: - GUI Variables
    private let stackOfStacks = CustomFactoryElements.createHorizontalStack()
    private let stackOfLabels = CustomFactoryElements.createVerticalStack()
    private let stackOfValues = CustomFactoryElements.createVerticalStack()
    private let pokemonNameLabel = CustomFactoryElements.createLabelName(name: "PokemonName:")
    private let pokemonTypeLabel = CustomFactoryElements.createLabelName(name: "PokemonType:")
    private let pokemonWeightLabel = CustomFactoryElements.createLabelName(name: "PokemonWeight:")
    private let pokemonHeightLabel = CustomFactoryElements.createLabelName(name: "PokemonHeight:")
    let pokemonImageView = CustomFactoryElements.createImage()
    let nameLabel = CustomFactoryElements.createLabel()
    let typeLabel = CustomFactoryElements.createLabel()
    let weightLabel = CustomFactoryElements.createLabel()
    let heightLabel = CustomFactoryElements.createLabel()
    
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
        view.addSubview(pokemonImageView)
        view.addSubview(stackOfStacks)
        stackOfStacks.addArrangedSubview(stackOfLabels)
        stackOfStacks.addArrangedSubview(stackOfValues)
        stackOfLabels.addArrangedSubview(pokemonNameLabel)
        stackOfLabels.addArrangedSubview(pokemonTypeLabel)
        stackOfLabels.addArrangedSubview(pokemonWeightLabel)
        stackOfLabels.addArrangedSubview(pokemonHeightLabel)
        stackOfValues.addArrangedSubview(nameLabel)
        stackOfValues.addArrangedSubview(typeLabel)
        stackOfValues.addArrangedSubview(weightLabel)
        stackOfValues.addArrangedSubview(heightLabel)
        view.addSubview(continueBotton)
    }
    
    private func setConstraints() {
        pokemonImageView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            $0.centerX.equalTo(self.view)
        }
        
        stackOfStacks.snp.makeConstraints {
            $0.top.equalTo(pokemonImageView.snp.bottom).offset(100)
            $0.centerX.equalTo(self.view.center.x)
        }
        
        continueBotton.snp.makeConstraints {
            $0.top.equalTo(stackOfStacks.snp.bottom).offset(150)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Action
    @objc private func continueBottonAction(sender: UIButton!) {
        self.presenter.tap()
    }
}
