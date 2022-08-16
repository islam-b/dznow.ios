//
//  HomeViewController.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 5/8/2022.
//

import UIKit
import SwiftMoment

class HomeViewController: UIViewController {

    @IBOutlet weak var newCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    private var newsDao: NewsDAO = NewsRemoteDAO()
    
    let categories : [Category]  = [
        Category(label: "Health"), Category(label: "Politics"),  Category(label: "Sports"),  Category(label: "Art"),
    ]
    
    var selectedCategory:Category! {
        didSet {
            filterNews()
        }
    }
    
    var news : [News] = []
    
    //var filtered : [News]!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        // Do any additional setup after loading the view.
        selectedCategory = categories[0]
    }
    
    private func filterNews() {
        /*filtered = news.filter { news in
            news.category == selectedCategory.label
        }
        print(selectedCategory)
        print(filtered)*/
        
        newsDao.getList { news, error in
            if (error != nil) {
                print(error?.message)
            } else {
                self.news = news!
                self.newCollectionView.reloadData()
            }
        }
        
        categoriesCollectionView.reloadData()
     }
    
    private func registerCells() {
        categoriesCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        newCollectionView.register(UINib(nibName: NewsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == categoriesCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            let category = categories[indexPath.row]
            cell.setup(category)
            cell.setActive(selectedCategory.label == category.label)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as! NewsCollectionViewCell
            cell.setup(news[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == categoriesCollectionView) {
            return categories.count
        } else {
            return news.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == categoriesCollectionView) {
            return CGSize()
        } else {
            return CGSize(width: collectionView.frame.width, height: 116)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == newCollectionView) {
            let controller = NewsDetailsViewController.instantiate()
            controller.news = news[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            selectedCategory = categories[indexPath.row]
        }
    }
    
    
    
}
