//
//  NewsDetails.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 9/8/2022.
//

import Foundation
import UIKit
import SwiftMoment
import Kingfisher

class NewsDetailsViewController: UIViewController {

    var news: News!
    
    @IBOutlet weak var cover: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageUrl = URL(string: news!.imageUrl)
        cover.kf.setImage(with: imageUrl)
        titleLabel.text = news?.title
        descriptionLabel.text = news?.contentSnippet

        dateLabel.text = moment(news!.isoDate)?.format("dd/MM/yyyy")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
