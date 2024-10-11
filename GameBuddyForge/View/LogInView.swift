import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @State private var hasPressedSignIn = false
    @State private var hasPressedSignUp = false
    @State private var isShowingSignUp = false
    
    @State private var lastErrorMessage = ""
    @State private var isPresentingError = false
    
    @State private var isAnimating = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image("GBF")
                .resizable()
                .frame(width: 200, height: 200)
                .scaleEffect(isAnimating ? 1.3 : 1.3)
                .opacity(isAnimating ? 1.4 : 1.0)
                .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: isAnimating)
                .onAppear {
                    isAnimating = true
                }
                .padding(.bottom, 20)
            Text("GAME BUDDY FORGE")
                            .font(.custom("Tanker", size: 40))
                            .foregroundColor(.white)
                            .bold()
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                            .padding(.bottom, 5)

                        Text("From Gamers For Gamers")
                            .font(.custom("Tanker", size: 30))
                            .foregroundColor(Color("elOrango"))
                            .shadow(color: .elOrango, radius: 30)
                            .padding(.bottom, 20)
                            .bold()
                            .overlay(
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(Color("elOrango"))
                                    .padding(.top, 5)
                            )

                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .tint(.black)

                        SecureField("Passwort", text: $password)
                            .foregroundColor(Color.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .tint(.black)

                        Spacer()

                        Button(action: attemptSignIn) {
                            Text("Log In")
                                .font(.custom("Tanker", size: 20))
                                .foregroundColor(.white)
                                .frame(width: 400, height: 50)
                                .background(Color("elOrango").cornerRadius(10))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 3))
                        }

                        Button(action: {
                            isShowingSignUp = true
                        }) {
                            Text("Sign Up")
                                .font(.custom("Tanker", size: 20))
                                .foregroundColor(.white)
                                .frame(width: 400, height: 50)
                                .background(Color("elOrango").cornerRadius(10))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 3))
                        }
                        .fullScreenCover(isPresented: $isShowingSignUp) {
                            RegisterView(isPresented: $isShowingSignUp)
                        }

                        Spacer()
                    }
                    .background(Color("myGray").edgesIgnoringSafeArea(.all))
                }
                
                private func attemptSignIn() {
                    Task {
                        hasPressedSignIn = true
                        do {
                            try await FirebaseAuthManager.shared.signIn(email: email, password: password)
                        } catch {
                            lastErrorMessage = error.localizedDescription
                            isPresentingError = true
                        }
                        hasPressedSignIn = false
                    }
                }
            }

            #Preview {
                LoginView()
            }
