//
//  ContentView.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 06.09.24.
//

import SwiftUI

struct GamesListView: View {
    
    @ObservedObject var viewModel = GamesViewModel()
    
    var body: some View {
        NavigationStack {
            VStack{
                Text("Games List")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.games) { game in
                            NavigationLink(value:game){
                                GamesRow(game: game)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.vertical,16)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color("myGray"))
            .navigationDestination(for: Game.self){ game in
                GameDetailView(game: game)
            }
        }
    }
}

#Preview {
    GamesListView()
}



