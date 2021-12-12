//
//  Injected.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//
import Swinject
import Foundation
import Combine
import SwiftUI

@propertyWrapper
struct Injected<T> {
    var wrappedValue: T

    init() {
        self.wrappedValue = AppContainer.shared.container.resolve(T.self)!
    }
}

@propertyWrapper
struct InjectedObject<T>: DynamicProperty where T: ObservableObject {
    @ObservedObject private var service: T
    
    public init() {
        self.service = AppContainer.shared.container.resolve(T.self)!
    }
    
    public var wrappedValue: T {
        get { return service }
        mutating set { service = newValue }
    }
    
    public var projectedValue: ObservedObject<T>.Wrapper {
        return self.$service
    }
}
