//
//  GalleryViewModel.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 17/02/25.
//

import Foundation

class GalleryViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    private let imagesService = ImagesDataService.shared
    
    init() {
        loadPhotos()
    }
    
    func loadPhotos() {
        photos = imagesService.getAll() ?? []
    }
    
    func deletePhoto(_ photo: Photo) {
        ImagesDataService.shared.delete(key: photo.id)
        loadPhotos()
    }
}
