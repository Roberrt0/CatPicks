//
//  ThirdDimensional.swift
//  modeladoapp
//
//  Created by Luis Roberto Martinez on 25/11/24.
//

import Foundation
import SwiftUI

struct ThirdDimensional: ButtonStyle {
    
    let cornerRadius: CGFloat = 25
    let offset: CGFloat = 5.0
    let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .offset(y: configuration.isPressed ? offset : 0)
            .padding()
            .padding(.horizontal) // 1
            .frame(maxWidth: .infinity) // 2
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(color)
                    .brightness(-0.2)
                    .offset(y: offset)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(color)
                    .offset(y: configuration.isPressed ? offset : 0)
            }
    }
}

#Preview("ThirdDimensional") {
    Button("press me") {
        // logic
    }
    .buttonStyle(ThirdDimensional(color: .yellow))
}
