//
//  Threat.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 30.09.24.
//

import Foundation
import FirebaseFirestore

struct Threat: Codable {
    
    let gametitle: String
    let title: String
    let playerCount: Int
    let description: String
    let gamerTag: String
}

