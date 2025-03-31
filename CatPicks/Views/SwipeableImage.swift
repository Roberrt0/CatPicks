//
//  SwipingTestView.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 19/03/25.
//

import SwiftUI

struct SwipeableImage: View {
    
    @State private var offset: CGSize = .zero
    @State private var swiped = false
    @State private var threshold = 80.0
    
    var uiImage: UIImage
    var onSwipeCompletion: (Bool) -> Void
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                //statistics // debugging
                
                // contrast with dark background
//                Color.white.opacity(0.2)
//                    .clipShape(RoundedRectangle(cornerRadius: 50))
//                    .opacity(getOpacity())
                
                // contrast with bright background
                Color.gray.opacity(0.2)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .opacity(getOpacity())
                
                // foreground
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    .padding(.vertical, 50)
            }
            
            .gesture(dragGesture)
            .disabled(swiped)
            .offset(x: offset.width * 1.5)
            .rotationEffect(getAngle())
            .animation(.linear(duration: 0.1), value: offset)
        }
    }
    
    // shows coordinates and other values
    var statistics: some View {
        VStack {
            Text("width: \(offset.width, specifier: "%.2f")").animation(.none)
            Text("degrees: \(getAngle().degrees, specifier: "%.2f")")
            Text("degrees: \(getOpacity(), specifier: "%.2f")")
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                offset.width = value.translation.width
                print("Drag changed, offset: \(offset)")
            }
            .onEnded(onDragEnded)
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let distance = value.translation.width
        if distance > threshold {
            swiped = true
            offset.width = 360
            onSwipeCompletion(true) // saves and randomizes
        } else if distance < -threshold {
            swiped = true
            offset.width = -360
            onSwipeCompletion(false) // randomizes
        } else { offset = .zero }
    }
    
    func getAngle() -> Angle {
        let distance = offset.width
        let minDistance = threshold
        
        if abs(distance) > minDistance {
            // substract min distance
            let adjustedDistance = distance - (minDistance * (distance > 0 ? 1 : -1))
            let degrees = adjustedDistance / 8.0
            return Angle(degrees: degrees)
        } else {
            return Angle(degrees: 0)
        }
    }
    
    func getOpacity() -> Double {
        let distance = abs(offset.width)
        
        if distance > threshold {
            return 1.0
        } else {
            return distance / threshold + 0.001
        }
    }
}

#Preview {
    ZStack {
//        Color.purple.ignoresSafeArea() // 1
        Color.yellow.opacity(0.1).ignoresSafeArea() // 2
        
        if let uiImage = UIImage(named: "splatoon-picture") {
            SwipeableImage(
                uiImage: uiImage,
                onSwipeCompletion: { imageSaved in
                    print("image was saved: \(imageSaved)")
                }
            )
        }
    }
}
