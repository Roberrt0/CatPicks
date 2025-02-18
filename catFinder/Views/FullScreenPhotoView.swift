//
//  FullScreenImageView.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 16/02/25.
//

import SwiftUI

struct FullScreenPhotoView: View {
    let photo: Photo
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea().onTapGesture {
                print("background pressed")
            }
            Image(uiImage: photo.image)
                .resizable()
                .scaledToFit()
            
            HStack {
                Image(systemName: "xmark").onTapGesture { dismiss() }
                Spacer()
                ellipsisMenu
            }
            .bold()
            .font(.title)
            .foregroundStyle(.white)
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
        }
    }
    
    var ellipsisMenu: some View {
        Menu {
            Button(role: .destructive) {
                print("deleting...")
            } label: {
                Label("Delete", systemImage: "trash")
            }
        } label: {
            Image(systemName: "ellipsis")
                .foregroundColor(.white)
        }
    }
}


#Preview {
    ZStack {
        let key = "splatoon-picture"
        let image = UIImage(resource: ImageResource(name: key, bundle: .main))
        let photo = Photo(id: key, image: image)
        FullScreenPhotoView(photo: photo)
    }
}
