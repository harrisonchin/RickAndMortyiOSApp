//
//  RMService.swift
//  RickAndMorty
//
//  Created by Harrison Chin on 12/1/23.
//

import Foundation


/// Primary API service object to get Rick and Morty data
final class RMService {
    /// shared singleton instance
    static let shared = RMService()
    
    /// privatized constructor
    private init() {}
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request:RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
    }
}
