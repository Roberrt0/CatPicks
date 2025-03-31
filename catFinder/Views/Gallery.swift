//
//  Gallery.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 30/11/24.
//

import SwiftUI

struct Gallery: View {
    
    @StateObject private var vm = GalleryViewModel()
    private let spacing: CGFloat = 10 // padding of each cell
    
    @State private var selectedPhoto: Photo?
    @State private var fullScreenPresented = false
    
    // Calculate square cells based on screen width and spacing
    var columns: [GridItem] {
        let size = (UIScreen.main.bounds.width - (4 * spacing)) / 3
        return Array(repeating: GridItem(.fixed(size), spacing: spacing), count: 3)
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(vm.photos) { photo in
                    getCell(for: photo)
                }
            }
            .padding(spacing)
        }
        .background(Color.yellow.opacity(0.1).ignoresSafeArea())
        .navigationTitle("Gallery")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(item: $selectedPhoto) { photo in
            FullScreenPhotoView(photo: photo, onDelete: {vm.deletePhoto(photo)})
        }
    }
    
    func getCell(for item: Photo) -> some View {
        Image(uiImage: item.image)
            .resizable()
            .scaledToFill()
            .frame(width: (UIScreen.main.bounds.width - (4 * spacing)) / 3,
                   height: (UIScreen.main.bounds.width - (4 * spacing)) / 3)
            .clipped()
            .cornerRadius(5)
            .onTapGesture {
                selectedPhoto = item
                fullScreenPresented = true
            }
    }
}

#Preview {
    NavigationStack {
        Gallery()
    }
}
