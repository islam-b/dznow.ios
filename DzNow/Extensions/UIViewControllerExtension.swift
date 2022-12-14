//
//  UIViewControllerExtension.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 9/8/2022.
//

import UIKit

extension UIViewController {
    
    static var identifier : String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        return controller
    }
    
}

