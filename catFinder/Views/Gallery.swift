//
//  Gallery.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 30/11/24.
//

import SwiftUI

struct Gallery: View {
    
    let images: [UIImage]
    private let spacing: CGFloat = 10 // padding of each cell
    
    // Calculate square cells based on screen width and spacing
    var columns: [GridItem] {
        let size = (UIScreen.main.bounds.width - (4 * spacing)) / 3
        return Array(repeating: GridItem(.fixed(size), spacing: spacing), count: 3)
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: (UIScreen.main.bounds.width - (4 * spacing)) / 3,
                               height: (UIScreen.main.bounds.width - (4 * spacing)) / 3)
                        .clipped()
                        .cornerRadius(5)
                        .onTapGesture {
                            print("Image tapped")
                        }
                }
            }
            .padding(spacing)
        }
        .background(Color.purple.ignoresSafeArea())
        .navigationTitle("Gallery")
//        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        Gallery(images: RandomizerViewModel().getImages())
    }
}
