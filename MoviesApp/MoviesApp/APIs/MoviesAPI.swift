//
//  MoviesAPI.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import Foundation
import Moya

public enum MoviesAPI {
    case search(String)
}

extension MoviesAPI: TargetType {
    public var baseURL: URL { URL(string: "https://api.themoviedb.org/3")! }
    static public var apiKey: String { return "b30abed6c448bd35e09e5000f1b79b7f" }
    public var path: String {
        switch self {
        case .search:
            return "/search/movie"
        }
    }
    public var method: Moya.Method { .get }

    public var task: Task {
        switch self {
        case .search(let query):
            return .requestParameters(parameters: ["query": query, "api-key": MoviesAPI.apiKey], encoding: URLEncoding.default)
        }
    }
    public var validationType: ValidationType {
        switch self {
        case .search:
            return .successCodes
        }
    }
    public var sampleData: Data {
        switch self {
        case .search:
            return "{}".data(using: String.Encoding.utf8)!
        }
    }
    public var headers: [String: String]? { nil }
}
