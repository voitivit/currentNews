//
//  NewsFeedPresenter.swift
//  currentNews
//
//  Created by Lewis on 26.06.2022.
//

import Foundation

final class NewsFeedPresenter: NewsFeedOutput {
    
    weak var controller: NewsFeedViewController?
    private let networkService = NetworkService()
    var headlines: [Headline] = []
    
    func getMainFeed() {
        networkService.getTopHeadlinesWithCountry(.russia) { [weak self] headlines in
            guard let self = self else { return }
            self.headlines = headlines
            self.controller?.reloadController()
        }
    }
    
    
}
