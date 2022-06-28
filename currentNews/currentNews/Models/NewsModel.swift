//
//  NewsModel.swift
//  currentNews
//
//  Created by Lewis on 14.06.2022.
//

import Foundation

// MARK: - NewsList
struct NewsList: Codable {
    let status: String
    let totalResults: Int
    let articles: [Headline]
}

// MARK: - Headline
struct Headline: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
