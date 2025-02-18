//
//  ImagesDataService.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 09/12/24.
//

import Foundation
import SwiftUI

// if Error, try using appendingPathComponent instead of appending - line 40, maybe 48

/*
 ImagesDataService Singleton
 - this class stores and pulls user-saved cat images from the
 app´s own document directory
 
 State: Finished?
 */

class ImagesDataService {
    
    static let shared = ImagesDataService()
    private let folderName = "downloaded_cat_photos"
    
    private init() {
       createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded() -> Bool {
        guard let url = getFolderPath() else {
            print("Error: can't get folder path")
            return false
        }

        if FileManager.default.fileExists(atPath: url.path) { return true }

        do {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            print("Folder created!")
            return true
        } catch {
            print("Error creating folder: \(error)")
            return false
        }
    }
    
    // ... /downloaded_cat_photos
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first?
            .appending(path: folderName) // note related i think
    }
    
    // ... /downloaded_cat_photos/image_key.png
    private func getImagePath(key: String) -> URL? {
        guard let folder = getFolderPath() else {
            print("cant get folder path")
            return nil
        }
        return folder.appending(path: key + ".png")
    }
    
    func isImageSaved(key: String) -> Bool {
        guard let path = getImagePath(key: key) else {
            print("cant get image path")
            return false
        }
        
        let fileExists = FileManager.default.fileExists(atPath: path.path(percentEncoded: false))
        return fileExists
    }
    
    /* ---- CREATE, READ, DELETE functions ---- */
    
    func add(key: String, value: UIImage) -> Bool {
        guard 
            let data = value.pngData(),
            let imgPath = getImagePath(key: key) else {
            print("Error before saving to FileManager")
            return false
        }

        do {
            try data.write(to: imgPath)
            return true
        } catch let error {
            print("Error saving to FileManager: \(error)")
            return false
        }
    }
    
    func get(key: String) -> UIImage? {
        guard
            let url = getImagePath(key: key),
            FileManager.default.fileExists(atPath: url.path) else {
            print("Error on getting, cant find requested file.")
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    func getAll() -> [Photo]? {
        guard let url = getFolderPath() else {
            print("Image folder doesn't exist")
            return nil
        }

        do {
            let contentPaths = try FileManager.default.contentsOfDirectory(atPath: url.path)

            let photos = contentPaths.compactMap { fileName -> Photo? in
                let fileURL = url.appendingPathComponent(fileName)
                guard let image = UIImage(contentsOfFile: fileURL.path) else { return nil }

                let id = fileName.replacingOccurrences(of: ".png", with: "")
                return Photo(id: id, image: image)
            }

            return photos

        } catch let error {
            print("Error while fetching images: \(error)")
            return nil
        }
    }
    
    func delete(key: String) -> Bool {
        guard 
            let url = getImagePath(key: key),
            FileManager.default.fileExists(atPath: url.path) else {
            print("Error deleting: file not found.")
            return false
        }

        do {
            try FileManager.default.removeItem(at: url)
            print("File deleted at: \(url)")
            return true
        } catch {
            print("Error deleting file: \(error)")
            return false
        }
    }
    
}
