//
//  RMRndpoint.swift
//  RickAndMorty
//
//  Created by Harrison Chin on 12/1/23.
//

import Foundation

/// Represent unique API endpoint
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
