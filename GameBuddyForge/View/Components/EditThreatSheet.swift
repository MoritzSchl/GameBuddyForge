//
//  EditThreatSheet.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 14.10.24.
//

import SwiftUI

struct EditThreatSheet: View {
    var viewModel: ThreatViewModel
    @State var threat: Threat
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Threat Details")) {
                    TextField("Title", text: $threat.title)
                    TextField("Game Title", text: $threat.gametitle)
                    TextField("Player Count", value: $threat.playerCount, formatter: NumberFormatter())
                    TextField("Description", text: $threat.description)
                    TextField("GamerTag", text: $threat.gamerTag)
                }
            }
            .navigationTitle("Edit Threat")
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Save") {
                    Task {
                        do {
                            viewModel.updateThreat(threat)
                            print("Threat wurde geupdatet")
                            dismiss()
                        }
                    }
                }
            )
        }
    }
}
