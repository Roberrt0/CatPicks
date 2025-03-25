//
//  TestingView.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 03/02/25.
//

import SwiftUI

struct SaveTestingView: View {
    
    @State var image: UIImage?
    let service = ImagesDataService.shared
    let key: String = "testImage"
    
    var body: some View {
        VStack {
            controls
            
            VStack {
                Text("Example image:")
                Image("splatoon-picture")
                    .resizable()
                    .scaledToFit()
            }
            
            VStack {
                Text("Stored image:")
                if let image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }
            }
            
            Spacer()
            
        }.padding()
    }
    
    var controls: some View {
        // cambiar por onpressed
        HStack {
            Button("save") {
                save()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button("fetch") {
                fetch()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button("delete") {
                delete()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }.foregroundStyle(.white).font(.headline)
    }
    
    func save() {
        guard
            let image = UIImage(named: "splatoon-picture")
        else {
            print("assets image not found")
            return
        }
        if service.isImageSaved(key: key) {
            print("image is already saved")
        } else {
            service.add(key: key, value: image)
        }
        print("hehe \(service.isImageSaved(key: key))")
    }
    
    func fetch() {
        guard let fetchedImage = service.get(key: key) else {
            print("fetch function failed.")
            return
        }
        
        image = fetchedImage
    }
    
    func delete() {
        service.delete(key: key)
        image = nil
    }
}

#Preview {
    SaveTestingView()
}

//HStack {
//    Button("save") {
//        
//    }
//    .padding()
//    .frame(maxWidth: .infinity)
//    .background(.green)
//    .clipShape(RoundedRectangle(cornerRadius: 10))
//    
//    Button("fetch") {
//        
//    }
//    .padding()
//    .frame(maxWidth: .infinity)
//    .background(.blue)
//    .clipShape(RoundedRectangle(cornerRadius: 10))
//    
//    Button("delete") {
//        
//    }
//    .padding()
//    .frame(maxWidth: .infinity)
//    .background(.red)
//    .clipShape(RoundedRectangle(cornerRadius: 10))
//}.foregroundStyle(.white).font(.headline)
