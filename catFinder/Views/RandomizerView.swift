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
            Color.purple.ignoresSafeArea()
            
            // foreground
            VStack(spacing: 30) {
                HStack {
                    Image(systemName: "cat.fill")
                    Text("CatFinder")
                        .font(.title)
                        .bold()
                        .underline(color: .white)
                    Image(systemName: "cat.fill")
                }.frame(maxWidth: .infinity)
                
                VStack {
                    if let image = vm.image {
                        SwipeableImage(
                            uiImage: image,
                            onSwipeCompletion: vm.swipeCompletion
                        )
                        .transition(AsymmetricTransition(insertion: .push(from: .top), removal: .opacity))
                    }
                }
                .id(vm.image)
                .frame(maxHeight: .infinity)
               
                
//                VStack(alignment: .trailing, spacing: 20) {
//                    saveButton
//                    randomizerButton
//                }.padding()
                
                HStack {
                    Button {
                        vm.swipeCompletion(saveImage: false)
                    } label: {
                        Text("<< Next")
                    }
                    
                    Spacer()
                    Text("Swipe or click")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button {
                        vm.swipeCompletion(saveImage: true)
                    } label: {
                        Text("Save >>")
                    }
                }
                .font(.title3)
                .fontWeight(.semibold)
                
            }
            .foregroundStyle(.white)
            .padding()
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("Cats seen: \(vm.sessionCount)")
                    .foregroundStyle(.white)
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: Gallery()) {
                    Text("Gallery")
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // Deprecated buttons
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
        RandomizerView().tint(.white)
    }
}
