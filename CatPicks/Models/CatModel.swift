//
//  CatModel.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 25/11/24.
//

import SwiftUI
import Foundation

/*
  - WARNING! -
 - api´s returned data does NOT include the breeds property
 - the output data is a non optional array even for a single image
 */


let catApiUrlString = "https://api.thecatapi.com/v1/images/search?limit=10"
let catApiUrlStringSingle = "https://api.thecatapi.com/v1/images/search"

struct CatModel: Codable, Identifiable {
    let id: String
    let width, height: Int
    let url: String
//    let breeds: [Breed]
    
    func getURL() -> URL? {
        URL(string: self.url)
    }
}


// unused structs below

// MARK: - Breed
struct Breed: Codable {
    let weight: Weight
    let id, name, temperament, origin: String
    let countryCodes, countryCode, lifeSpan: String
    let wikipediaURL: String

    enum CodingKeys: String, CodingKey {
        case weight, id, name, temperament, origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case lifeSpan = "life_span"
        case wikipediaURL = "wikipedia_url"
    }
}

// MARK: - Weight
struct Weight: Codable {
    let imperial, metric: String
}
