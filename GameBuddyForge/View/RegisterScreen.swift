//
//  SignUpScreen.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 18.09.24.
//

import SwiftUI

struct RegisterView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            Color("myGray")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()

                // Title
                Text("Create an Account")
                    .font(.custom("Tanker", size: 35))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 40)

                // Username Field
                TextField("Username", text: $username)
                    .padding()
                    .background(Color("elOrango"))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                // Password Field
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color("elOrango"))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(.horizontal)

                // Confirm Password Field
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color("elOrango"))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(.horizontal)

                Spacer()

                // Register Button
                Button(action: {
                    // TODO: Register Action with Firebase/Firestore
                }) {
                    Text("Register")
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
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterView()
}
