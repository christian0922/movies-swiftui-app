//
//  MoviesApp.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import SwiftUI
import Swinject

@main
struct MoviesApp: App {
    let container = Container()
    init() {
        AppContainer.shared.container = container
        let assembler = Assembler(container: container)
        assembler.apply(assemblies: [ServiceAssembly(), ViewModelAssembly()])
    }
    
    var body: some Scene {
        WindowGroup {
            MovieListView()
        }
    }
}
