import SwiftUI

struct ThreatSheet: View {
    var game: Game
    @State private var activity = ""
    @State private var playerCount = 1
    @State private var description = ""
    @State private var gamertag = ""
    @Environment(\.dismiss) var dismiss
    
    let playerOptions = Array(1...10)
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Create Threat")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
                Text("Game: \(game.title)")
                    .font(.custom("Tanker", size: 22))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.elOrango)
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextField("Activity", text: $activity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                HStack {
                    Text("Player Count:")
                        .font(.custom("Tanker", size: 18))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Picker("Player Count", selection: $playerCount) {
                        ForEach(playerOptions, id: \.self) {
                            Text("\($0)")
                                .foregroundStyle(Color.white)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 100, height: 80)
                    .clipped()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Description:")
                        .font(.custom("Tanker", size: 18))
                        .foregroundColor(.white)
                    
                    TextEditor(text: $description)
                        .frame(height: 150)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                TextField("Gamertag", text: $gamertag)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Save")
                            .font(.custom("Tanker", size: 18))
                            .foregroundColor(.white)
                            .frame(width: 140, height: 40)
                            .background(Color("elOrango"))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
            .background(Color.myGray.ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    ThreatSheet(game: .sample)
}
