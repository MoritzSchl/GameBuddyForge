import SwiftUI

struct GameDetailView: View {
    var game: Game
    
    @State private var showAddThreatSheet = false
    @State private var isAnimating = false
    
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
                                    .cornerRadius(20)
                                    .shadow(color: .elOrango, radius: 20)
                            } placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.gray.opacity(0.3))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(game.title)
                                .font(.custom("Tanker", size: 35))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                            Text("Developer: \(game.publisher)")
                                .font(.custom("Tanker", size: 16))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                        }
                        Spacer()
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
                    
                    
                    Spacer()
    
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
                   
                    VStack {
                        Button(action: {
                            showAddThreatSheet = true
                        }) {
                            HStack {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                                Text("Create Thread for this Game")
                                    .font(.custom("Tanker", size: 18))
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                Color("elOrango")
                                    .cornerRadius(10)
                            )
                            .padding(.horizontal)
                            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                        }
                        .scaleEffect(isAnimating ? 1.05 : 1.0)
                        .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }
                    }
                    .padding(.bottom, 16)
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
