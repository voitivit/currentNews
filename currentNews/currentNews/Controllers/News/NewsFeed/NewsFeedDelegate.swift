//
//  NewsFeedDelegate.swift
//  currentNews
//
//  Created by Lewis on 26.06.2022.
//

import Foundation

protocol NewsFeedOutput: AnyObject {
    func getMainFeed()
}

protocol NewsFeedInput: AnyObject {
    func reloadController()
}
