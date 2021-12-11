//
//  MovieSummary.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import Foundation
import RxSwift

struct MovieSummary: Identifiable {
    var id: Int
    let title: String
    let image: String
    let budget: Int
}


