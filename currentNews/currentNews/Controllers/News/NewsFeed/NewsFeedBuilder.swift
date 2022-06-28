//
//  NewsFeedBuilder.swift
//  currentNews
//
//  Created by Lewis on 26.06.2022.
//

import Foundation

struct NewsFeedBuilder {
    
    static func build() -> NewsFeedViewController {
        let controller = NewsFeedViewController()
        let presenter = NewsFeedPresenter()
        controller.presenter = presenter
        presenter.controller = controller
        return controller
    }
}
