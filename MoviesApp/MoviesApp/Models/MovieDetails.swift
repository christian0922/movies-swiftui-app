//
//  MovieDetails.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import Foundation

struct MovieDetails: Codable, Identifiable {
    let id: Int
    let title: String
    let budget: Int
    let overview: String
    let releaseDate: String
    let backdropPath: String?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case budget
        case overview
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
    }
}

extension MovieDetails {
    private static var imageBaseUrl = "https://image.tmdb.org/t/p/w400"
    var posterUrl: URL? {
        if let posterPath = posterPath {
            return URL(string: "\(MovieDetails.imageBaseUrl)\(posterPath)")
        }
        return nil
    }
    
    var backdropUrl: URL? {
        if let backdropPath = backdropPath {
            return URL(string: "\(MovieDetails.imageBaseUrl)\(backdropPath)")
        }
        return nil
    }
    
    var budgetString: String {
        if budget == 0 {
            return "Budget: N/A"
        }
        return "Budget: \(budget.formatted(.currency(code: "USD")))"
    }
    
    var releaseDateString: String {
        return "Release date: \(releaseDate)"
    }
}
