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
                        .font(.custom("Tanker", size: 18))     .foregroundColor(.white)
                        .padding(10)
                        .background(Color("elOrango").opacity(0.9))
                        .cornerRadius(5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, -2)
                        .padding(.bottom, -10)
                    Spacer()
                    Text(game.publisher)
                        .font(.custom("Tanker", size: 18))
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color("elOrango").opacity(0.9))
                        .cornerRadius(5)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, -2)
                        .padding(.bottom, -10)
                }
                .padding(.bottom, 8)
            }
        }
        .frame(height: 200)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 3)
        )
        .clipped()
    }
}

#Preview {
    GamesRow(game: .sample)
}
