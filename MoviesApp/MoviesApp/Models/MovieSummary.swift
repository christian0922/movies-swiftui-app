//
//  MovieSummary.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import Foundation

struct MovieSummary: Codable, Identifiable {
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case id
    }
}


