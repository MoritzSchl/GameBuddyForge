//
//  GamesViewModel.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 09.09.24.
//

import Foundation

@MainActor
class GamesViewModel: ObservableObject {
    @Published var games: [Game] = []

    @Published var searchText: String = ""{
        didSet {
            Task{
                await load()
            }
        }
    }
    
    
    init() {
        Task {
            await load()
        }
    }
    
    private func load() async {
        do {
                games = try await repository.fetchGames()
        } catch {
            let error = error as! GamesRepoError
            print("Could not load Game data: \(error.description)")
        }
    }
    
    private let repository = GamesRepository()
    
}

