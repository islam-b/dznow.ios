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
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    private var newsDao: NewsDAO = NewsRemoteDAO()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadContent()

        if (news.imageUrl != nil) {
            let imageUrl = URL(string: news.imageUrl!)
            cover.kf.setImage(with: imageUrl)
        } else {
            cover.image = UIImage(named: "NewsPlaceholder")
        }
        titleLabel.text = news?.title

        dateLabel.text = moment(news!.isoDate)?.format("dd/MM/yyyy")
        
    }
    
    
    func loadContent() {
        loading.startAnimating()
        newsDao.getContent(id: news.id) { content, error in
            self.loading.stopAnimating()
            if (error != nil) {
                print(error?.message)
            } else {
                self.descriptionLabel.text = content!
            }
        }
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
