//
//  Threat.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 30.09.24.
//

struct Threat: Identifiable, Codable {
    var id: String?
    var gametitle: String
    var title: String
    var playerCount: Int
    var description: String
    var gamerTag: String
    var userID: String

    var isOwnedByCurrentUser: Bool {
        return FirebaseAuthManager.shared.userID == userID
    }
}
