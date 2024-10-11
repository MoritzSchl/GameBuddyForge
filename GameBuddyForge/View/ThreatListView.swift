import SwiftUI

struct ThreatListView: View {
    @ObservedObject var viewModel = ThreatViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color("myGray")
                    .ignoresSafeArea()

                VStack {
                    Text("Game Threats")
                        .font(.custom("Tanker", size: 35))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.top, 20)

                    ScrollView {
                        VStack(spacing: 16) {
                            if viewModel.threats.isEmpty {
                                Text("No threats available")
                                    .foregroundColor(.white)
                                    .padding()
                            } else {
                                ForEach(viewModel.threats, id: \.title) { threat in
                                    ThreatRow(threat: threat)
                                }
                            }
                        }
                        .padding(.vertical, 16)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchThreats()
        }
    }
}

#Preview {
    ThreatListView()
}
