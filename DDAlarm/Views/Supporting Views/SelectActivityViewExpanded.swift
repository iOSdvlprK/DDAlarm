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
        VStack(spacing: 35) {
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
                                .stroke(lineWidth: isSelectedColor ? 3 : 0.5)
                        }
                        .onTapGesture {
                            withAnimation {
                                currentColorIndex = i
                            }
                        }
                }
            }
            
            // row of activities
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(activities, id: \.self) { activity in
                        let isSelectedActivity = activity == currentActivity
                        
                        Image(systemName: activity)
                            .font(isSelectedActivity ? .headline : .subheadline)
                            .foregroundStyle(isSelectedActivity ? currentColor : nickel)
                            .opacity(isSelectedActivity ? 1.0 : 0.7)
                            .onTapGesture {
                                withAnimation {
                                    currentActivity = activity
                                }
                            }
                            .padding(6)
                            .background {
                                Circle()
                                    .fill(
                                        isSelectedActivity && currentColor != .black ? .black.opacity(0.9) : .clear
                                    )
                            }
                            .overlay {
                                Circle()
                                    .stroke(isSelectedActivity ? currentColor : .black, lineWidth: isSelectedActivity ? 1 : 0.0)
                            }
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(nickel, lineWidth: 1)
        }
    }
}

#Preview {
    SelectActivityViewExpanded(currentColorIndex: .constant(0), currentActivity: .constant(activities[0]))
        .padding()
}
