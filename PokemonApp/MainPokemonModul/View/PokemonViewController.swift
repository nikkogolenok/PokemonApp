//
//  ViewController.swift
//  PokemonApp
//
//  Created by Никита Коголенок on 1.10.23.
//

import UIKit
import SnapKit

class PokemonViewController: UIViewController {
    
    // MARK: - Variable
    var presenter: PokemonViewPresenterProtocol!
    
    // MARK: - GUI Variable
    var tableView = UITableView()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
    }
    
    // MARK: - Methods
    func createTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.indentifier)
        }
    }
}
