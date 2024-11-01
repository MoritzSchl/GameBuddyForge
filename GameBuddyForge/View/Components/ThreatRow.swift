import SwiftUI

struct ThreatRow: View {
    var threat: Threat
    var currentUserID: String
    @State private var showEditThreatSheet = false
    @ObservedObject var viewModel: ThreatViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                Text(threat.gametitle)
                    .font(.custom("Tanker", size: 30))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if threat.userID == currentUserID {
                    Image(systemName: "person.fill")
                        .foregroundColor(.yellow)
                }
            }
        
            VStack(alignment: .leading, spacing: 5) {
                Text(threat.title)
                    .font(.custom("Tanker", size: 18))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Text("Player Count: \(threat.playerCount)")
                    .font(.custom("Tanker", size: 18))
                    .foregroundColor(.white)
                
                Text(threat.description)
                    .font(.custom("Tanker", size: 20))
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                Text("GamerTag: \(threat.gamerTag)")
                    .font(.custom("Tanker", size: 18))
                    .foregroundColor(.white)
            }
            
            if threat.userID == currentUserID {
                HStack {
                    Button(action: {
                        showEditThreatSheet = true
                    }) {
                        Text("Edit")
                            .font(.custom("Tanker", size: 18))
                            .foregroundColor(.blue)
                            .padding(6)
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                    
                    Button(action: {
                        Task {
                            viewModel.deleteThreat(threat)
                        }
                    }) {
                        Text("Delete")
                            .font(.custom("Tanker", size: 18))
                            .foregroundColor(.red)
                            .padding(6)
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.red, lineWidth: 2)
                            )
                    }
                }
                .padding(.top, 8)
            }
        }
        .padding()
        .background(
            threat.userID == currentUserID ?
            LinearGradient(gradient: Gradient(colors: [Color(.black), Color("elOrango").opacity(0.4)]), startPoint: .top, endPoint: .bottom) :
                LinearGradient(gradient: Gradient(colors: [Color("elOrango"), Color(.black)]), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white.opacity(0.7), lineWidth: 2)
        )
        .sheet(isPresented: $showEditThreatSheet) {
            EditThreatSheet(viewModel: viewModel, threat: threat)
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}
