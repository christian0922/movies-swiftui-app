//
//  AppContainer.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import Swinject

public final class AppContainer {
    public static let shared = AppContainer()
    private init() {
        // no-op
    }

    public unowned var container: Container!
}
