import SwiftUI

struct ThreatRow: View {
    
    var threat: Threat

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
            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("elOrango"), Color("darkOrange")]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white.opacity(0.7), lineWidth: 2)
            )
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

#Preview {
    ThreatRow(threat: Threat(gametitle: "Beispielspiel", title: "Beispiel Bedrohung", playerCount: 4, description: "Dies ist eine Beispielbeschreibung für eine Bedrohung.", gamerTag: "BeispielGamerTag"))
}
