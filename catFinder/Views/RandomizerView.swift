//
//  RandomizerView.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 25/11/24.
//

/* check stats variable for "vm.image != nil" code */
/* To Do
 1) finish swipe functionality
 2) fix gallery order of recent saves
 3) add styles and animations
 */

import SwiftUI

struct RandomizerView: View {
    
    @StateObject var vm = RandomizerViewModel()
    @State private var saved = false
    
    var body: some View {
        ZStack {
            // background
            
//            Color.purple.ignoresSafeArea() // 1
            Color.yellow.opacity(0.1).ignoresSafeArea() // 2
            
            Image("cat-emoji")
                .resizable()
                .scaledToFit()
                .opacity(0.3)
                .padding(.horizontal)
            
            // foreground
            VStack(spacing: 30) {
                Image("catpicks-logo-simple")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                
                VStack {
                    if let image = vm.image {
                        SwipeableImage(
                            uiImage: image,
                            onSwipeCompletion: vm.swipeCompletion
                        )
                        .transition(AsymmetricTransition(insertion: .push(from: .top), removal: .opacity))
                    } else {
                        ProgressView()
                    }
                }
                .id(vm.image)
                .frame(maxHeight: .infinity)
                
                HStack {
                    Button {
                        vm.swipeCompletion(saveImage: false)
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Next")
                        }
                        .foregroundStyle(.white)
                        .padding()
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    
                    Spacer()
                    Text("Swipe or click")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button {
                        vm.swipeCompletion(saveImage: true)
                    } label: {
                        HStack {
                            Text("Save")
                            Image(systemName: "arrow.right")
                        }
                        .foregroundStyle(.white)
                        .padding()
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                }
                .font(.headline)
            }
            .padding()
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack(spacing: 5) {
                    Image(systemName: "pawprint.fill")
                        .foregroundStyle(.catOrange)
                    Text("\(vm.sessionCount)")
                        .contentTransition(.numericText())
                        .animation(.easeIn, value: vm.sessionCount)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: Gallery()) {
                    Text("Gallery")
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // Unused previous buttons
    var saveButton: some View {
        Button {
            vm.saveButtonPressed()
            saved.toggle()
        } label: {
            Image(systemName: saved ? "bookmark.fill" : "bookmark")
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 30)
        }
        .background(.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
    
    var randomizerButton: some View {
        Button {
            vm.getCat()
        } label: {
            Text("Randomize cat!")
        }
        .buttonStyle(ThirdDimensional(color: .white))
        .foregroundStyle(.black)
        .font(.headline)
    }
}

#Preview {
    NavigationStack {
        RandomizerView()
//            .tint(.white) // 1
    }
}
