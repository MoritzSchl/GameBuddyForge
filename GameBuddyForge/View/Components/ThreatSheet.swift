import SwiftUI

struct ThreatSheet: View {
    var game: Game
    @State var activity = ""
    @State var playerCount = 1
    @State var description = ""
    @State var gamertag = ""
    @Environment(\.dismiss) var dismiss
    
    let playerOptions = Array(1...10)
    let viewModel = ThreatViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Create Thread")
                    .font(.custom("Tanker", size: 40))
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                    .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Game")
                        .font(.custom("Tanker", size: 20))
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    Text("Game: \(game.title)")
                        .font(.custom("Tanker", size: 22))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("elOrango"))
                        .cornerRadius(8)
                        .padding(.horizontal, 15)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Activity")
                        .font(.custom("Tanker", size: 20))
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    TextField("Activity", text: $activity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                        .tint(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black.opacity(0.3), lineWidth: 1)
                        )
                        .padding(.horizontal, 15)
                }
                
                VStack(alignment: .leading) {
                    Text("Player Count")
                        .font(.custom("Tanker", size: 20))
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    
                    Menu {
                        ForEach(playerOptions, id: \.self) { count in
                            Button(action: {
                                playerCount = count
                            }) {
                                Text("\(count)")
                            }
                        }
                    } label: {
                        HStack {
                            Text("\(playerCount) Spieler")
                                .font(.custom("Tanker", size: 18))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black.opacity(0.5), lineWidth: 1)
                        )
                        .padding(.horizontal, 15)
                    }
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Description")
                        .font(.custom("Tanker", size: 20))
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    
                    TextEditor(text: $description)
                        .frame(height: 150)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black.opacity(0.3), lineWidth: 1)
                        )
                        .padding(.horizontal, 15)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Gamertag")
                        .font(.custom("Tanker", size: 20))
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    
                    TextField("Gamertag", text: $gamertag)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                        .tint(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black.opacity(0.3), lineWidth: 1)
                        )
                        .padding(.horizontal, 15)
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        viewModel.saveThreat(gametitle: game.title, title: activity, playerCount: playerCount, description: description, gamerTag: gamertag)
                        dismiss()
                    }) {
                        Text("Create Thread")
                            .font(.custom("Tanker", size: 20))
                            .foregroundColor(.white)
                            .frame(width: 180, height: 50)
                            .background(Color("elOrango").cornerRadius(10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 3))
                    }
                }
                .padding(.bottom, 20)
            }
            .background(Color("myGray").edgesIgnoringSafeArea(.all))
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
