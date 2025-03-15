//
//  MainGradient.swift
//  DDAlarm
//
//  Created by joe on 3/15/25.
//

import SwiftUI

struct MainGradient: View {
    var startRadius: CGFloat = 0.0
    let endRadius: CGFloat
    var scaleX: CGFloat = 2.0
    var opacityLinGrad = 0.5
    var opacityRadGrad = 1.0
    var yellowColor = yellow
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [blue, purple, pink],
                startPoint: .top,
                endPoint: .bottom
            )
            .opacity(opacityLinGrad)
            
            RadialGradient(
                colors: [yellowColor, .clear],
                center: .bottom,
                startRadius: startRadius,
                endRadius: endRadius
            )
            .opacity(opacityRadGrad)
            .scaleEffect(x: scaleX)
        }
    }
}

#Preview {
    MainGradient(endRadius: 75)
        .frame(width: screenWidth, height: 100)
}
