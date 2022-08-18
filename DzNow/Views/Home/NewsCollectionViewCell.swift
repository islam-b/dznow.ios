//
//  NewsCollectionViewCell.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 8/8/2022.
//

import UIKit
import Kingfisher
import SwiftMoment

class NewsCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: NewsCollectionViewCell.self)
    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    func setup(_ news:News) {
        if (news.imageUrl != nil) {
            let imageUrl = URL(string: news.imageUrl!)
            image.kf.setImage(with: imageUrl)
        } else {
            image.image = UIImage(named: "NewsPlaceholder")
        }
        title.text = news.title
        date.text = moment(news.isoDate)?.format("dd/MM/yyyy")
    }

    
}
