//
//  ContentView.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 25/11/24.
//

/* TODO
 
 -> Save images UI
 -> Save images service
 -> add and improve animations
 -> Implement accessibility functions
 
 *Notes*
 I dont know which component use for the Gallery UI, saved images
 must me able to be deleted and moved as in the photo app, user
 should also be able to download images and maybe other things.
 
 planning to save images in the app´s directory, but i probably
 should look into alternatives just in case.
 
 Look into alternatives to AsyncImage so i can implement smoother
 animations for the cat image.
 
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        StartingView().tint(.white)
    }
}

#Preview {
    ContentView()
}
