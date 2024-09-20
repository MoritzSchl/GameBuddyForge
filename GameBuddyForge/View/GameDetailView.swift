import SwiftUI

struct GameDetailView: View {
    var game: Game
    
    var body: some View {
        ZStack {
            Color.myGray
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    // Hero Image
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
                            
                            // Linear gradient for better text readability
                            LinearGradient(
                                colors: [.clear, .black.opacity(0.7)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(height: 100)
                        }
                    }
                    
                    // Title and Developer Info
                    VStack(alignment: .leading, spacing: 8) {
                        Text(game.title)
                            .font(.custom("Tanker", size: 35))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        Text("Developer: \(game.publisher)")
                            .font(.custom("Tanker", size: 16))
                            .foregroundColor(.white.opacity(0.7))
                            .padding(.horizontal)
                        
                        // Genre and platform
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
                    }

                    // Short Description
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
                    
                    // Publisher and Release Date
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
                    
                    // Game Website Link
                    Link(destination: URL(string: game.gameURL)!) {
                        HStack {
                            Label("Visit Game Website", systemImage: "link")
                        }
                        .font(.custom("Tanker", size: 18))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.elOrango)
                        .clipShape(RoundedRectangle(cornerRadius: 9.0))
                        .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    GameDetailView(game: .sample)
}
