//
//  CatCountManager.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 26/11/24.
//

import Foundation
import SwiftUI


/*
 SINGLETON CLASS
 manages the total and per session count of seen cats
 
 Currently NOT in use
 */

class CatCountManager {
    
    @AppStorage("totalCount") var totalCount: Int = 0
    @Published var sessionCount: Int = 0
    
    static let shared = CatCountManager()
    
    private init() {}
  
    // MARK: methods
    func increase() {
        sessionCount += 1
        totalCount += 1
    }
    
    // obsolete
    func sumTotal() {
        totalCount += sessionCount
        sessionCount = 0
    }
    
}
