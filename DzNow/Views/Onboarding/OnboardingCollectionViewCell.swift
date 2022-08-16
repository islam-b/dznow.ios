//
//  OnboardingCollectionViewCell.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 5/8/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var title: UILabel!
    
    
    @IBOutlet weak var descrip: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        image.image = slide.image
        title.text = slide.title
        descrip.text = slide.description
    }
    
}
    
