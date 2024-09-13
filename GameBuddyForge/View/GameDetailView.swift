import SwiftUI

struct GameDetailView: View {
    var game: Game
    
    let dummyThreats = [
        "LFM for ranked team, need support",
        "Looking for DPS for raid night",
        "Anyone up for casual gaming tonight?",
        "Need 2 players for Arena (Diamond rank)",
        "Looking for a tank for Mythic Dungeon run"
    ]
    
    var body: some View {
        ZStack {
            Color.myGray
                .ignoresSafeArea()
            VStack {
                if let imageUrl = URL(string: game.thumbnail) {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 4.0, y: 2.0)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                ScrollView {
                    VStack(alignment: .center, spacing: 16) {
                        VStack(alignment: .center, spacing: 8) {
                            Text(game.title)
                                .font(.largeTitle)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            
                            Text(game.shortDescription)
                                .font(.body)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            HStack {
                                Text("Genre: \(game.genre.rawValue)")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                
                                Text("Platform: \(game.platform.rawValue)")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                            Text("Publisher: \(game.publisher)")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            
                            Text("Release Date: \(game.releaseDate)")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            Link("Visit Game Website", destination: URL(string: game.gameURL)!)
                                .font(.headline)
                                .foregroundColor(.blue)
                                .padding(.vertical, 8)
                        }
                        .padding(.horizontal)
                        }
                        .padding(.top, 16)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 16)
                }
            }
        }
    }


#Preview {
    GameDetailView(game: .sample)
}
