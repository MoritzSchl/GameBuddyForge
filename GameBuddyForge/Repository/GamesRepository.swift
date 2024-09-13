//
//  File.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 09.09.24.
//

import Foundation

class GamesRepository {
    
    func fetchGames() async throws -> [Game] {
        guard let url = URL(string: "https://www.freetogame.com/api/games") else { throw GamesRepoError.invalidURL }
        guard let (data, _) = try? await URLSession.shared.data(from: url) else { throw GamesRepoError.requestFailed }
        guard let result = try? JSONDecoder().decode([Game].self, from: data) else { throw GamesRepoError.failedParsing  }
        return result
    }
}
enum GamesRepoError: Error {
    case invalidURL
    case requestFailed
    case failedParsing
    
    var description: String {
        switch self {
        case .invalidURL:
            "The provided URL is not valid"
        case .requestFailed:
            "The request failed"
        case .failedParsing:
            "The data could not be parsed"
        }
    }
}
