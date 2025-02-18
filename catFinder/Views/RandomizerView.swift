//
//  RandomizerView.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 25/11/24.
//

/* check stats variable for "vm.image != nil" code */

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
                    Text("CatRandomizer")
                        .font(.title)
                        .bold()
                        .underline(color: .white)
                    Image(systemName: "cat.fill")
                }.frame(maxWidth: .infinity)
                
                stats
                
                Spacer()
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
                
                VStack(alignment: .trailing, spacing: 20) {
                    saveButton
                    randomizerButton
                }.padding()
                
            }
            .foregroundStyle(.white)
            
        }
        .navigationBarBackButtonHidden()
    }
    
    var stats: some View {
        HStack {
            Text("Cats seen: \(vm.sessionCount)")
            Spacer()
            NavigationLink(destination: Gallery()) {
                Text("Gallery")
            }
        }
        .font(.headline)
        .padding()
        .onTapGesture {
            let imageExists = vm.image != nil
            print("image: \(imageExists)")
        }
    }
    
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
    }
}
