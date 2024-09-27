//
//  SignUpScreen.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 18.09.24.
//

import SwiftUI

struct RegisterView: View {
    @Binding var isPresented: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("myGray")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()

                Text("Create an Account")
                    .font(.custom("Tanker", size: 35))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 40)

                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(.black)
                    .padding(.horizontal)

                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                
                

                Spacer()

                Button(action: {
                    if password == confirmPassword {
                        Task {
                            do {
                                try await FirebaseAuthManager.shared.signUp(email: email, password: password)
                                isPresented = false
                            } catch {
                                print("Error signing up: \(error)")
                            }
                        }
                    } else {
                        print("Passwords do not match.")
                    }
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
            .overlay(alignment: .topLeading) {
                Button("Cancel") {
                    dismiss()
                }
                .padding()
                .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    RegisterView(isPresented: .constant(true))
}
