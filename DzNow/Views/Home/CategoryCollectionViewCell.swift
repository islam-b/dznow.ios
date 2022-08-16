//
//  CategoryCollectionViewCell.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 6/8/2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)

    
    @IBOutlet weak var label: UILabel!
     
    
    func setup(_ category: Category) {
        label.text = category.label
    }
    
    func setActive(_ isActive: Bool) {
        if (isActive) {
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textColor = UIColor.black
        } else {
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.gray
        }
    }

}
