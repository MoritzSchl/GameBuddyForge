//
//  GamesRow.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 09.09.24.
//

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
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .background(Color.gray.opacity(0.3))
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
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(5)
                        .padding(.leading, 8)
                    
                    Spacer()
                    
                    Text( game.publisher)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(5)
                        .padding(.trailing, 8)
                }
                .padding(.bottom, 8)
            }
        }
        .frame(height: 200)
        .cornerRadius(10)
        .clipped()
    }
}

#Preview {
    GamesRow(game: .sample)
}
