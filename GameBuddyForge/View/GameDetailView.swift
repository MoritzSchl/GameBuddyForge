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
                        .padding(.horizontal)
                    }
                    
                    HStack {
                        Text(game.title)
                            .font(.custom("Tanker", size: 35))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Link(destination: URL(string: game.gameURL)!) {
                            Circle()
                                .fill(Color("elOrango"))
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Image(systemName: "link")
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                )
                        }
                        .padding(.trailing, 20)
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Developer: \(game.publisher)")
                            .font(.custom("Tanker", size: 16))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
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
                    
                    Spacer()
                    
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
                        .background(Color("elOrango").cornerRadius(10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.6), lineWidth: 1)
                        )
                        .padding(.horizontal)
                        .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 4)
                    }
                    .scaleEffect(isAnimating ? 1.02 : 1.0)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: isAnimating)
                    .onAppear {
                        isAnimating = true
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
