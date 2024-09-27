//
//  GameBuddyForgeApp.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 06.09.24.
//

import SwiftUI
import Firebase

@main
struct GameBuddyForgeApp: App {
    
    init(){
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            if FirebaseAuthManager.shared.isUserSignedIn {
                GamesListView()
                    .tint(.white)
            }else{
                OnboardingView()
                    .tint(.white)
            }
        }
    }
}
