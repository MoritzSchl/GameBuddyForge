import SwiftUI

struct GamesListView: View {
    
    @ObservedObject var viewModel = GamesViewModel()
    @State private var isShowingThreatList = false
    @State private var isShowingGameDetail = false
    @State private var selectedGame: Game? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("myGray")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Games List")
                        .font(.custom("Tanker", size: 30))
                        .foregroundStyle(.white)
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(viewModel.games) { game in
                                Button(action: {
                                    selectedGame = game
                                    isShowingGameDetail = true
                                }) {
                                    GamesRow(game: game)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .padding(.horizontal)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.vertical, 16)
                    }
                }
                .scrollContentBackground(.hidden)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            isShowingThreatList = true
                        }) {
                            HStack {
                                Image(systemName: "magnifyingglass.circle")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                Text("LFG")
                                    .font(.custom("Tanker", size: 20))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: logOut) {
                            HStack {
                                Image(systemName: "person.crop.circle.badge.xmark")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                Text("Log Out")
                                    .font(.custom("Tanker", size: 20))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                
                .navigationDestination(isPresented: $isShowingThreatList) {
                    ThreatListView()
                }
            }
            .navigationDestination(isPresented: $isShowingGameDetail) {
                if let selectedGame = selectedGame {
                    GameDetailView(game: selectedGame)
                }
            }
        }
    }
    
    private func logOut() {
        Task {
            FirebaseAuthManager.shared.signOut()
        }
    }
}

#Preview {
    GamesListView()
}
