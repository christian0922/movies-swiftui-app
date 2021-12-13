//
//  ListResponse.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 12..
//

import Foundation

struct ListResponse<T>: Codable where T: Codable {
    let results: [T]
    let page: Int
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
