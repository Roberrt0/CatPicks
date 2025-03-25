//
//  TransitionTestView.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 24/03/25.
//

import SwiftUI

struct TransitionTestView: View {
    
    @State private var showView = true
    var transition = AsymmetricTransition(insertion: .push(from: .top), removal: .opacity)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.purple.ignoresSafeArea()
            
            VStack {
                if let uiImage = UIImage(named: "splatoon-picture"),showView {
                    SwipeableImage(
                        uiImage: uiImage,
                        onSwipeCompletion: { imageSaved in
                            print("image was saved: \(imageSaved)")
                        }
                    )
                    .transition(transition)
                }
            }
            .animation(.easeIn, value: showView)
            
            Button("toggle") {
                showView.toggle()
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
   TransitionTestView()
}
