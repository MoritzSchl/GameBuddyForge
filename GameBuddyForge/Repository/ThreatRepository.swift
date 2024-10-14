//
//  ThreatRepository.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 30.09.24.
//

import SwiftUI
import FirebaseFirestore

class ThreatRepository {
    
    
    var threats: [Threat] = []
    
    func createThreat(_ threat: Threat) throws {
        try dbCollection.addDocument(from: threat)
    }
    
    func updateThreat(_ threat: Threat) async throws {
        guard let id = FirebaseAuthManager.shared.userID else { throw DataError.noDocumentID }
        try dbCollection.document(id).setData(from: threat)
    }
    
    func deleteThreat(_ threat: Threat) async throws {
        guard let id = FirebaseAuthManager.shared.userID else { throw DataError.noDocumentID }
        try await dbCollection.document(id).delete()
    }
    
    func fetchThreats() async throws -> [Threat] {
            let snapshot = try await dbCollection.getDocuments()
            return snapshot.documents.compactMap { document in
                try? document.data(as: Threat.self)
            }
        }
    }
    
    private let dbCollection = Firestore.firestore().collection("threats")
    


enum DataError: LocalizedError {
    case failedSaving
    case noDocumentID
    
    var errorDescription: String {
        switch self {
        case .failedSaving:
            "Could not persist the item"
        case .noDocumentID:
            "Didn't find a document ID"
        }
    }
}

