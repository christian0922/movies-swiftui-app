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
    @Published var movies: [MovieDetails] = []
    @Published var hasError: Bool = false
    var searchText = PassthroughSubject<String, Never>()
}

class MovieListViewModel: BaseMovieListViewModel {
    var cancellables = Set<AnyCancellable>()
    @Injected var moviesService: MoviesServiceProtocol

    override init() {
        super.init()
        self.searchText.filter {
            $0 != ""
        }.flatMap { searchText in
            self.moviesService.searchMovies(query: searchText)
        }
        .sink(receiveCompletion: { [weak self] completion in
            guard let self = self, case let .failure(error) = completion else { return }
            self.hasError = true
            print(error)
        }, receiveValue: { [weak self] response in
            guard let self = self else { return }
            self.hasError = false
            self.movies = []
            response.results.forEach {
                self.getMovieDetails(id: $0.id)
            }
        }).store(in: &cancellables)
    }
    
    func getMovieDetails(id: Int) {
        self.moviesService
            .getMovieDetails(id: id)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self, case let .failure(error) = completion else { return }
                self.hasError = true
                print(error)
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.hasError = false
                self.movies.append(response)
                print(response.budget)
            }).store(in: &cancellables)
    }
}
