//
//  SourceModel.swift
//  currentNews
//
//  Created by Lewis on 18.06.2022.
//

import Foundation
 
// MARK: - SourcesList
struct SourcesList: Codable {
    let status: String
    let sources: [SourceModel]
}

// MARK: - SourceModel
struct SourceModel: Codable {
    let id: String
    let name: String
    let description: String
    let url: String
    let category: Categories.RawValue
    let language: NewsLanguages.RawValue
    let country: CountriesListISOCode.RawValue
}
