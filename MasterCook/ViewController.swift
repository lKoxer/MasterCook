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
    }
}

