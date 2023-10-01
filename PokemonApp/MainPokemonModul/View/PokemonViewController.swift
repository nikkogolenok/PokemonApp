//
//  ViewController.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 1.10.23.
//

import UIKit

class PokemonViewController: UIViewController {
    
    // MARK: - Variable
    var collectionView: UICollectionView?

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCollectionView()
    }
    
    // MARK: - Methods
    func createCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                 height: (view.frame.size.width/3)-4)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: PokemonCollectionViewCell.indentifier)
    }
}
