//
//  ThreatViewModel.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 30.09.24.
//

import Foundation

class ThreatViewModel {
    
    
    var error: LocalizedError?
    
    
    var isSaving = false
    var didSaveSuccessfully = false
    
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
    let repo = ThreatRepository()
}

