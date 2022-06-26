//
//  LaunchRouter.swift
//  currentNews
//
//  Created by emil kurbanov on 20.06.2022.
//

import UIKit

class LaunchRouter: Router {
    
    init(viewController: UIViewController) {
        super.init(controller: viewController)
    }
    
    func toNewsViewController() {
        let next = NewsFeedBuilder.build()
        controller.navigationController?.pushViewController(next, animated: true)
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        controller.present(alert, animated: true, completion: nil)
    }

}

