//
//  ViewController.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 3/8/2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collection: UICollectionViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

}

