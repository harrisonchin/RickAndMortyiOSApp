//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Harrison Chin on 12/1/23.
//

import Foundation

/// Object that represents a singlet API call
final class RMRequest {
    /// API components
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Download endpoint
    private let endpoint: RMEndpoint
    /// Path components for API, if Any
    private let pathComponents: Set<String>
    /// query arguments for API, if Any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed and constructed API url
    public var url:URL? {
        return URL(string: urlString)
    }
    
    /// Download http method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Contruct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParameters: Collection of query parameters
    public init(endpoint: RMEndpoint,
         pathComponents: Set<String> = [],
         queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
        
    }
}
