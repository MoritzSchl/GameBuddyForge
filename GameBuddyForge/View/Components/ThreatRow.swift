import SwiftUI

struct ThreatRow: View {
    var threat: Threat
    var currentUserID: String
    @State private var showEditThreatSheet = false
    @ObservedObject var viewModel: ThreatViewModel
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(threat.gametitle)
                        .font(.custom("Tanker", size: 30))
                        .foregroundColor(.white)
                        .padding(.top, 0)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(threat.title)
                        .font(.custom("Tanker", size: 18))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.top, 5)
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
                .padding(.vertical)
                
                Spacer()
                
                if threat.userID == currentUserID {
                    VStack {
                        Button(action: {
                            showEditThreatSheet = true
                        }) {
                            Text("Edit")
                                .font(.custom("Tanker", size: 14))
                                .foregroundColor(.blue)
                        }
                        Button(action: {
                            Task{
                                viewModel.deleteThreat(threat)
                            }
                        }) {
                            Text("Delete")
                                .font(.custom("Tanker", size: 14))
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .padding()
            .background(
                threat.userID == currentUserID ?
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .top, endPoint: .bottom) :
                    LinearGradient(gradient: Gradient(colors: [Color("elOrango"), Color("darkOrange")]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white.opacity(0.7), lineWidth: 2)
            )
        }
        .sheet(isPresented: $showEditThreatSheet){
            EditThreatSheet(viewModel: viewModel, threat: threat)
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

