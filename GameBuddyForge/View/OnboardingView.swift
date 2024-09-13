//
//  OnboardingVIew.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 11.09.24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("GBF")
                .resizable()
                .frame(width: 365, height: 365)
                .padding(.bottom, 80)
            VStack(spacing: 0) {
                Text("Willkommen bei")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom, 4)
                Text("GameBuddyForge")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
            }
            .multilineTextAlignment(.center)
            Button(action: {
            }) {
                Text("Enjoy your Game")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 220, height: 50)
                    .background(
                        Color.elOrango
                            .cornerRadius(10)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 3)
                    )
            }
            
            Spacer()
        }
        .padding()
        .background(Color.myGray.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    OnboardingView()
}
