//
//  CircularTimeView.swift
//  DDAlarm
//
//  Created by joe on 3/25/25.
//

import SwiftUI

struct CircularTimeView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    let size: CGFloat
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 20)
            .frame(width: size)
            .overlay {
                Text("Circular Alarm")
            }
    }
}

#Preview {
//    ScrollView {
        VStack(spacing: 50) {
            CircularTimeView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm(), size: screenWidth / 2)
            
//            CircularTimeView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm(), size: screenWidth / 4)
//            
//            CircularTimeView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm(), size: screenWidth * 0.75)
        }
//    }
}
