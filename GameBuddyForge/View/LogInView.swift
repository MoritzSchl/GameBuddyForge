//
//  LogInView.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 11.09.24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @State private var hasPressedSignIn = false
    @State private var hasPressedSignUp = false
    @State private var isShowingSignUp = false
    
    @State private var lastErrorMessage = ""
    @State private var isPresentingError = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image("GBF")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.bottom, 20)
            Text("GAME BUDDY FORGE")
                .font(.custom("Tanker", size: 35))
                .foregroundColor(.white)
                .bold()
            Text("From Gamers For Gamers")
                .font(.custom("Tanker", size: 35))
                .foregroundColor(.white)
                .padding(.bottom, 20)
                .bold()
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .foregroundStyle(.black)
                .padding(.horizontal)
                .tint(.black)
            SecureField("Passwort", text: $password)
                .foregroundStyle(Color(.black))
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal)
                .tint(.black)
            Spacer()
            Button(action: attemptSignIn ){
                Text("Log In")
                    .font(.custom("Tanker", size: 20))
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(
                        Color("elOrango")
                            .cornerRadius(10)
                    )
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 3)
                    )
            }
            Button(action: {
            }) {
                Text("Passwort vergessen")
                    .font(.custom("Tanker", size: 20))
                    .foregroundColor(.white)
            }
            Button(action: {
                            isShowingSignUp = true // Sign-Up View anzeigen
                        }) {
                            Text("Sign Up")
                                .font(.custom("Tanker", size: 20))
                                .foregroundColor(.white)
                                .frame(width: 110, height: 50)
                                .background(
                                    Color("elOrango")
                                        .cornerRadius(10)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 3)
                                )
                        }
                        .fullScreenCover(isPresented: $isShowingSignUp) {
                            RegisterView(isPresented: $isShowingSignUp) // Präsentiere SignUp View
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
    
    private func attemptSignUp() {
        Task {
            hasPressedSignUp = true
            do {
                try await FirebaseAuthManager.shared.signUp(email: email, password: password)
            } catch {
                lastErrorMessage = error.localizedDescription
                isPresentingError = true
            }
            hasPressedSignUp = false
        }
    }
}


#Preview {
    LoginView()
}
