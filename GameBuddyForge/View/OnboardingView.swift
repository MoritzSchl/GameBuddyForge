import SwiftUI

struct OnboardingView: View {
    @State private var logoScale: CGFloat = 0.5
    @State private var textOpacity: Double = 0
    @State private var buttonScale: CGFloat = 1.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("myGray").edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Image("GBF")
                        .resizable()
                        .frame(width: 365, height: 365)
                        .scaleEffect(logoScale)
                        .onAppear {
                            withAnimation(.easeOut(duration: 1.0)) {
                                logoScale = 1.0
                            }
                        }
                        .padding(.bottom, 80)
                    
                    VStack(spacing: 0) {
                        Text("Willkommen bei")
                            .font(.custom("Tanker", size: 35))
                            .foregroundColor(.white)
                            .opacity(textOpacity)
                        
                        Text("GameBuddyForge")
                            .font(.custom("Tanker", size: 35))
                            .bold()
                            .foregroundColor(.white)
                            .opacity(textOpacity)
                    }
                    .multilineTextAlignment(.center)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.5).delay(0.5)) {
                            textOpacity = 1.0
                        }
                    }
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Enjoy your Game")
                            .font(.custom("Tanker", size: 20))
                            .foregroundColor(.white)
                            .frame(width: 220, height: 50)
                            .background(
                                Color("elOrango")
                                    .cornerRadius(10)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .scaleEffect(buttonScale)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                                    buttonScale = 1.1
                                }
                            }
                    }
                    .padding(.top, 30)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    OnboardingView()
}
