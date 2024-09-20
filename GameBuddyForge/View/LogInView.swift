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
                .background(Color("elOrango"))
                .cornerRadius(8)
                .foregroundStyle(.white)
                .padding(.horizontal)
            SecureField("Passwort", text: $password)
                .foregroundStyle(Color(.white))
                .padding()
                .background(Color("elOrango"))
                .cornerRadius(8)
                .padding(.horizontal)
            Spacer()
            Button(action: {
            }) {
                Text("Log In")
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
            Button(action: {
            }) {
                Text("Passwort vergessen")
                    .font(.custom("Tanker", size: 20))
                    .foregroundColor(.white)
            }
            Button(action: {
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
            
            Spacer()
        }
        .background(Color("myGray").edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    LoginView()
}
