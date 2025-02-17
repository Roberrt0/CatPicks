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
                
                Color.purple.ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer()
                    VStack {
                        Image(systemName: "cat.fill")
                            .resizable()
                            .scaledToFit()
                        Text("Cat Randomizer")
                            .font(.title)
                            .bold()
                            .underline(color: .white)
                    }
                    
                    Text("Get a random image of a cat, thats all there is to the app, any cat lover would be instantly cautivated by the endless amount of cats you can find here.")
                        .font(.headline)
                    
                    Spacer()
                    
                    NavigationLink("Start Randomizing") {
                        RandomizerView()
                    }
                    .buttonStyle(ThirdDimensional(color: .white))
                    .foregroundStyle(.black)
                    .font(.headline)
                    
                    Spacer()
                }
                .padding(40)
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    StartingView()
}
