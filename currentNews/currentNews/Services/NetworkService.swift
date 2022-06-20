//
//  NetworkService.swift
//  currentNews
//
//  Created by Lewis on 14.06.2022.
//

import Foundation

struct NetworkService {
    
    private let apiKey = "9ae8d7e609144345a643c16cd2425af6"
    private let urlSession = URLSession.shared
    private let decoder = JSONDecoder()
    private let headlinesAndArticlesQueue = DispatchQueue(label: "headlines.and.articles.network.service.queue", qos: .userInitiated)
    private let sourcesQueue = DispatchQueue(label: "sources.network.service.queue", qos: .userInitiated)
    private let baseURLString = "https://newsapi.org/v2/"
    
    // MARK: - Private Methods
    
    private func getTopHeadlinesOrArticles(url: URL, result: @escaping ([Headline]) -> ()) {
        headlinesAndArticlesQueue.async {
            urlSession.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error.localizedDescription)
                }
                
                if let data = data {
                    print(data)
                    do {
                        let newsList = try decoder.decode(NewsList.self, from: data)
                        let headlines = newsList.articles.map({ $0 })
                        result(headlines)
                    } catch {
                        print(error, error.localizedDescription)
                    }
                }
                
            }.resume()
        }
    }
    
    private func getSources(url: URL, result: @escaping ([SourceModel]) -> ()) {
        sourcesQueue.async {
            urlSession.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error.localizedDescription)
                }
                
                if let data = data {
                    print(data)
                    do {
                        let sourcesList = try decoder.decode(SourcesList.self, from: data)
                        let sources = sourcesList.sources
                        result(sources)
                    } catch {
                        print(error, error.localizedDescription)
                    }
                }
                
            }.resume()
        }
    }
    
    // MARK: - Public methods
    
    func getArticlesAbout(query: String, result: @escaping ([Headline]) -> ()) {
        let path = "everything?q=\(query)&apiKey=\(apiKey)"
        guard let url = URL(string: baseURLString + path) else { return }
        getTopHeadlinesOrArticles(url: url) { results in
            result(results)
        }
    }
    
    func getArticlesAbout(query: String, and sortBy: NewsSortingType, result: @escaping ([Headline]) -> ()) {
        let path = "everything?q=\(query)&sortBy=\(sortBy.rawValue)&apiKey=\(apiKey)"
        guard let url = URL(string: baseURLString + path) else { return }
        getTopHeadlinesOrArticles(url: url) { results in
            result(results)
        }
    }
    
    func getTopHeadlinesWithCountry(_ countryISOCode: CountriesListISOCode, result: @escaping ([Headline]) -> ()) {
        let path = "top-headlines?country=\(countryISOCode.rawValue)&apiKey=\(apiKey)"
        guard let url = URL(string: baseURLString + path) else { return }
        getTopHeadlinesOrArticles(url: url) { results in
            result(results)
        }
    }
    
    func getTopHeadlinesWithCountryAndCategory(_ countryISOCode: CountriesListISOCode, category: Categories, result: @escaping ([Headline]) -> ()) {
        let path = "top-headlines?country=\(countryISOCode.rawValue)&category=\(category.rawValue)&apiKey=\(apiKey)"
        guard let url = URL(string: baseURLString + path) else { return }
        getTopHeadlinesOrArticles(url: url) { results in
            result(results)
        }
    }
    
    func getAllSources(result: @escaping ([SourceModel]) -> ()) {
        let path = "top-headlines/sources?&apiKey=\(apiKey)"
        guard let url = URL(string: baseURLString + path) else { return }
        getSources(url: url) { sources in
            result(sources)
        }
    }
    
    func getSourcesWithCategory(_ category: Categories, result: @escaping ([SourceModel]) -> ()) {
        let path = "top-headlines/sources?category=\(category.rawValue)&apiKey=\(apiKey)"
        guard let url = URL(string: baseURLString + path) else { return }
        getSources(url: url) { sources in
            result(sources)
        }
    }
    
    func getSourcesWithCounrty(_ country: CountriesListISOCode, result: @escaping ([SourceModel]) -> ()) {
        let path = "top-headlines/sources?country=\(country.rawValue)&apiKey=\(apiKey)"
        guard let url = URL(string: baseURLString + path) else { return }
        getSources(url: url) { sources in
            result(sources)
        }
    }
}
