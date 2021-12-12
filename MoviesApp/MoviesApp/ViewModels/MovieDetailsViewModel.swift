//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 12..
//

import Foundation
import Combine
import Moya

class BaseMovieDetailsViewModel: ObservableObject {
    @Published var movieDetails: MovieDetails = MovieDetails(title: "", overview: "", releaseDate: "", backdrop: "")
}

class MovieDetailsViewModel: BaseMovieDetailsViewModel {
    override init() {
        super.init()
        self.movieDetails = MovieDetails(title: "Title", overview: "Overview", releaseDate: "ReleaseDate", backdrop: "image")
    }
}
