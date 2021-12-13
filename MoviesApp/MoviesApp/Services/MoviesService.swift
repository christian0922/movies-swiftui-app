//
//  MoviesService.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 13..
//

import Foundation
import Combine
import Moya

protocol MoviesServiceProtocol {
    func searchMovies(query: String) -> AnyPublisher<ListResponse<MovieSummary>, MoyaError>
    func getMovieDetails(id: Int) -> AnyPublisher<MovieDetails, MoyaError>
}

struct MoviesService: MoviesServiceProtocol {
    private let apiProvider = MoyaProvider<MoviesAPI>()
    
    func searchMovies(query: String) -> AnyPublisher<ListResponse<MovieSummary>, MoyaError> {
        return apiProvider.requestPublisher(.search(query))
            .map(ListResponse<MovieSummary>.self)
    }
    
    func getMovieDetails(id: Int) -> AnyPublisher<MovieDetails, MoyaError>  {
        return apiProvider.requestPublisher(.details(id))
            .map(MovieDetails.self)
    }
}
