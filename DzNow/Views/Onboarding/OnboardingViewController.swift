//
//  Onboarding.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 5/8/2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPage = 0 {
        didSet {
            if (currentPage == slides.count-1) {
                // change button's text
            }
            pageControl.currentPage = currentPage

        }
    }
    
    var slides: [OnboardingSlide] =  [
        OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "NewsPlaceholder")),
        OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "NewsPlaceholder")),
        OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "NewsPlaceholder"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = slides.count
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onNext(_ sender: Any) {
        if (currentPage < slides.count-1) {
            currentPage = currentPage+1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        } else {
            if (isAuthenticated()) {
                goToHomeViewController()
            } else {
                goToAuthViewController()
            }
            
        }
    }
    
    
    
    private func isAuthenticated() -> Bool {
        let keychain = KeychainUtils.instance()
        let access_token = keychain.retreive(key: "access_token")
        if (access_token != nil) {
            //TODO validate expiration
            return true
        }
        return false
    }
    
    private func goToHomeViewController() {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "homeVC")
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    private func goToAuthViewController() {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "authVC") as! AuthViewController
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true)
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

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier,
                                                      for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = collectionView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
