//
//  SelectActivityViewExpanded.swift
//  DDAlarm
//
//  Created by joe on 4/1/25.
//

import SwiftUI

struct SelectActivityViewExpanded: View {
    @Binding var currentColorIndex: Int
    @Binding var currentActivity: String
    
    var circleFrame = 20.0
    
    var currentColor: Color {
        mainColors[currentColorIndex]
    }
    
    var body: some View {
        // row of circles for selecting color
        HStack(spacing: 30) {
            ForEach(0 ..< mainColors.count, id: \.self) { i in
                let color = mainColors[i]
                let isSelectedColor = color == currentColor
                
                Circle()
                    .fill(color)
                    .frame(width: circleFrame, height: circleFrame)
                    .shadow(color: color.opacity(0.7), radius: 10, x: 0, y: 5)
                    .scaleEffect(isSelectedColor ? 1.1 : 1.0)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: isSelectedColor ? 3 : 0.1)
                    }
                    .onTapGesture {
                        withAnimation {
                            currentColorIndex = i
                        }
                    }
            }
        }
    }
}

#Preview {
    SelectActivityView(currentColorIndex: .constant(0), currentActivity: .constant(activities[0]))
        .padding()
}
