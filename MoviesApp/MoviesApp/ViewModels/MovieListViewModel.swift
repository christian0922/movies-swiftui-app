//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import Foundation
import Combine
import Moya

class BaseMovieListViewModel: ObservableObject {
    @Published var movieSummaries: [MovieSummary] = []
    var searchText = PassthroughSubject<String, Never>()
}

class MovieListViewModel: BaseMovieListViewModel {
    var cancellables = Set<AnyCancellable>()
    override init() {
        super.init()
        self.movieSummaries = [
            MovieSummary(id: 0, title: "title1", image: "image", budget: 5000),
            MovieSummary(id: 1, title: "title2", image: "image", budget: 6000)
        ]
        
        self.searchText.sink { _ in
            self.movieSummaries = [
                MovieSummary(id: 0, title: "title1", image: "image", budget: 5000),
                MovieSummary(id: 1, title: "title2", image: "image", budget: 6000),
                MovieSummary(id: 2, title: "title3", image: "image", budget: 6000)
            ]
        }.store(in: &cancellables)
    }
}
