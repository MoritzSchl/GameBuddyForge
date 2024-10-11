import SwiftUI

struct GamesRow: View {
    var game: Game
    
    var body: some View {
        ZStack {
            if let imageUrl = URL(string: game.thumbnail) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .tint(.white)
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .background(Color.gray.opacity(0.3))
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Text(game.genre.rawValue)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color("elOrango").opacity(0.6))
                        .cornerRadius(5)
                        .padding(.leading, 8)
                    
                    Spacer()
                    
                    Text(game.publisher)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color("elOrango").opacity(0.6))
                        .cornerRadius(5)
                        .padding(.trailing, 8)
                }
                .padding(.bottom, 8)
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 3)
            )
        }
        .frame(height: 200)
        .cornerRadius(20)
        .clipped()
    }
}

#Preview {
    GamesRow(game: .sample)
}
