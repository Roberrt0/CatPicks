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
 - manages the total and per session count of seen cats
 
 *notes*
 consider if the count should be increased if by any chance
 a cat that has already been seen pops up again
 */

class CatCountManager {
    
    @AppStorage("totalCount") var totalCount: Int = 0
    @Published var sessionCount: Int = 0
    
    static let shared = CatCountManager()
    
    private init() {}
    
    // obsolete deinit
    /*
//    deinit {
//        sumTotal()
//        print("manager deinitialized!")
//    }
     */
    
    // MARK: methods
    func increase() {
        sessionCount += 1
        totalCount += 1
    }
    
    // obsolete func
    func sumTotal() {
        totalCount += sessionCount
        sessionCount = 0
    }
    
}
