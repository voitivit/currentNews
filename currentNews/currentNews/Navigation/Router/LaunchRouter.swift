//
//  LaunchRouter.swift
//  currentNews
//
//  Created by emil kurbanov on 20.06.2022.
//

import Foundation
import UIKit

class LaunchRouter: Router {
    init(viewController: UIViewController) {
        super.init(controller: viewController)
    }
    
    func toNewsViewController() {
        perform(segue: "showNews")
    }

}

