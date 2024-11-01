import SwiftUI

struct EditThreatSheet: View {
    
    var viewModel: ThreatViewModel
    @State var threat: Threat
    @Environment(\.dismiss) var dismiss
    
    let playerCountOptions = Array(1...10)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("EDIT THREAD")
                    .font(.custom("Tanker", size: 40))
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                    .padding(.bottom, 5)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Game Title")
                        .font(.custom("Tanker", size: 20))
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    Text("Game: \(threat.gametitle)")
                        .font(.custom("Tanker", size: 22))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("elOrango"))
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("Title")
                        .font(.custom("Tanker", size: 20))
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    TextField("Suche 3 Leute für ...", text: $threat.title)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .tint(.black)
                }
                VStack(alignment: .leading) {
                    Text("Player Count")
                        .font(.custom("Tanker", size: 20))
                        .foregroundColor(.white)
                        .padding(.leading , 15)
                    Menu {
                        ForEach(playerCountOptions, id: \.self) { count in
                            Button(action: {
                                threat.playerCount = count
                            }) {
                                Text("\(count)")
                            }
                        }
                    } label: {
                        HStack {
                            Text("\(threat.playerCount) Spieler")
                                .font(.custom("Tanker", size: 18))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("Description")
                        .font(.custom("Tanker", size: 20))
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    TextEditor(text: $threat.description)
                        .frame(height: 120)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .tint(.black)
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("GamerTag")
                        .font(.custom("Tanker", size: 20))
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    
                    TextField("Dein GamerTag", text: $threat.gamerTag)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .tint(.black)
                }
                Spacer()
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Cancel")
                            .font(.custom("Tanker", size: 20))
                            .foregroundColor(.white)
                            .frame(width: 180, height: 50)
                            .background(Color("elOrango").cornerRadius(10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 3))
                    }
                    Button(action: {
                        Task {
                            viewModel.updateThreat(threat)
                            dismiss()
                        }
                    }) {
                        Text("Save")
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
        }
    }
}

#Preview {
    EditThreatSheet(viewModel: ThreatViewModel(), threat: Threat(gametitle: "Test Game", title: "Suche Mitspieler", playerCount: 3, description: "Kurze Beschreibung hier", gamerTag: "Gamer123", userID: "12345"))
}
