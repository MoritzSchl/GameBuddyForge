//
//  ThreatViewModel.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 30.09.24.
//

import Foundation

class ThreatViewModel: ObservableObject {
    @Published var threats = [Threat]()

    var error: LocalizedError?
    var isSaving = false
    var didSaveSuccessfully = false
    
    let repo = ThreatRepository()

    func saveThreat(gametitle: String, title: String, playerCount: Int, description: String, gamerTag: String) {
        Task {
            isSaving = true
            defer { isSaving = false }
            
            do {
                let threat = Threat(gametitle: gametitle, title: title, playerCount: playerCount, description: description, gamerTag: gamerTag)
                try repo.createThreat(threat)
                didSaveSuccessfully = true
            } catch let error as LocalizedError {
                self.error = error
            }
        }
    }

    func fetchThreats() {
        Task {
            do {
                let fetchedThreats = try await repo.fetchThreats()
                DispatchQueue.main.async {
                    self.threats = fetchedThreats
                }
            } catch {
                print("Error fetching threats: \(error)")
            }
        }
    }
}


