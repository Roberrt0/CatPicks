//
//  StartingView.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 25/11/24.
//

import SwiftUI

struct StartingView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
//                Color.purple.ignoresSafeArea() // 1
                Color.yellow.opacity(0.1).ignoresSafeArea() // 2
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    VStack {
                        Image("cat-emoji") // 2
                            .resizable()
                            .scaledToFit()
                        Image("catpicks-logo-simple")
                            .resizable()
                            .scaledToFit()
                    }
                    
                    Text("Watch endless pictures of cats from all around the world and save your favorite ones so you can view them anywhere at any time!")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink("Start Randomizing") {
                        RandomizerView()
                    }
                    .buttonStyle(ThirdDimensional(color: .mint))
                    .foregroundStyle(.white)
                    .foregroundStyle(.black)
                    .font(.headline)
                    .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(40)
            } // Zstack end
        }
    }
}

#Preview {
    StartingView()
}
