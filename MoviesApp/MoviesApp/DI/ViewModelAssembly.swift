//
//  ViewModelAssembly.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import Foundation
import Swinject

struct ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(BaseMovieListViewModel.self) { _ in
            return MovieListViewModel()
        }
    }
}
