//
//  GameBuddyForgeApp.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 06.09.24.
//

import SwiftUI

@main
struct GameBuddyForgeApp: App {
    var body: some Scene {
        WindowGroup {
            GameDetailView(game: .sample)
        }
    }
}
