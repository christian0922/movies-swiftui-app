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
    case details(Int)
}

extension MoviesAPI: TargetType {
    public var baseURL: URL { URL(string: "https://api.themoviedb.org/3")! }
    private static var apiKey: String { return "b30abed6c448bd35e09e5000f1b79b7f" }
    
    public var path: String {
        switch self {
        case .search:
            return "/search/movie"
        case .details(let id):
            return "/movie/\(id)"
        }
    }
    
    public var method: Moya.Method { .get }
    
    public var task: Task {
        switch self {
        case .search(let query):
            return .requestParameters(
                parameters: [
                    "query": query,
                    "api_key": MoviesAPI.apiKey,
                    "language": "en-US",
                    "include_adult": "false",
                    "page": "1"
                    ],
                encoding: URLEncoding.default)
        case .details:
            return .requestParameters(
                parameters: [
                    "api_key": MoviesAPI.apiKey,
                    "language": "en-US",
                ],
                encoding: URLEncoding.default)
        }
    }
    
    public var validationType: ValidationType { .successCodes }
    public var sampleData: Data {  return "{}".data(using: String.Encoding.utf8)! }
    public var headers: [String: String]? { nil }
}
