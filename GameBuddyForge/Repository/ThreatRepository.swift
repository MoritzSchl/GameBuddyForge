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
        guard let threatID = threat.id else { throw DataError.noDocumentID }
        try dbCollection.document(threatID).setData(from: threat, merge: true)
    }
    
    
    func deleteThreat(_ threat: Threat) async throws {
        guard let threatID = threat.id else { throw DataError.noDocumentID }
        try await dbCollection.document(threatID).delete()
    }
    
    func fetchThreats() async throws -> [Threat] {
        let snapshot = try await dbCollection.getDocuments()
        
        return snapshot.documents.compactMap { document in
            let threat = try? document.data(as: Threat.self)
            if var threat = threat {
                threat.id = document.documentID
                return threat
            } else {
                return nil
            }
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

