//
//  ViewController.swift
//  MasterCook
//
//  Created by Kox on 27.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var qwe = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        qwe.getAllRecipes()
        initialize()
    }
}

extension ViewController {
    func initialize() {
        let label = UILabel()
        label.text = "Welcome!"
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        let topAnchor = label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        let bottonAnchor = label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100)
        let leftAnchor = label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
        let rightAnchor = label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10)
        NSLayoutConstraint.activate([topAnchor, bottonAnchor, leftAnchor, rightAnchor])
    }
}
