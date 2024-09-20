import SwiftUI

struct GameDetailView: View {
    var game: Game
    @State private var showAddThreatSheet = false
    
    var body: some View {
        ZStack {
            Color.myGray
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    if let imageUrl = URL(string: game.thumbnail) {
                        ZStack(alignment: .bottom) {
                            AsyncImage(url: imageUrl) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(15)
                                    .shadow(radius: 10)
                            } placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.gray.opacity(0.3))
                            }
                            
                            LinearGradient(
                                colors: [.clear, .black.opacity(0.7)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(height: 100)
                        }
                    }
                    
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(game.title)
                                .font(.custom("Tanker", size: 35))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                            Text("Developer: \(game.publisher)")
                                .font(.custom("Tanker", size: 16))
                                .foregroundColor(.white.opacity(0.7))
                                .padding(.horizontal)
                        }
                        
                        Spacer()
                        
                        
                        Button(action: {
                            showAddThreatSheet = true
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("elOrango").opacity(0.4))
                                .clipShape(Circle())
                                .shadow(radius: 10)
                        }
                        .padding(.trailing)
                    }
                    
                    
                    HStack {
                        Text(game.genre.rawValue)
                            .font(.custom("Tanker", size: 14))
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color("elOrango").opacity(0.4))
                            .cornerRadius(8)
                        
                        Spacer()
                        
                        Text(game.platform.rawValue)
                            .font(.custom("Tanker", size: 14))
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color("elOrango").opacity(0.4))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Game Description")
                            .font(.custom("Tanker", size: 22))
                            .foregroundColor(.white)
                            .underline()
                            .padding(.horizontal)
                        
                        Text(game.shortDescription)
                            .font(.custom("Tanker", size: 18))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Publisher: \(game.publisher)")
                            .font(.custom("Tanker", size: 18))
                            .foregroundColor(.white)
                            .underline()
                            .padding(.horizontal)
                        
                        Text("Release Date: \(game.releaseDate)")
                            .font(.custom("Tanker", size: 18))
                            .foregroundColor(.white)
                            .underline()
                            .padding(.horizontal)
                    }
                    
                    Link(destination: URL(string: game.gameURL)!) {
                        HStack {
                            Image(systemName: "link")
                            Text("Visit Game Website")
                        }
                        .font(.custom("Tanker", size: 18))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("elOrango"), lineWidth: 2)
                        )
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                .padding(.top)
            }
        }
        .sheet(isPresented: $showAddThreatSheet) {
            ThreatSheet(game: game)
        }
    }
}

#Preview {
    GameDetailView(game: .sample)
}
