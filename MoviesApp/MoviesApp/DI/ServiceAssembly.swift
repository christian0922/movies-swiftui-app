//
//  ServiceAssembly.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 13..
//

import Foundation
import Swinject

struct ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MoviesServiceProtocol.self) { _ in
            return MoviesService()
        }
    }
}
