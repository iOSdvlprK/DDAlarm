//
//  AddEditCircularAlarmView.swift
//  DDAlarm
//
//  Created by joe on 3/25/25.
//

import SwiftUI

struct AddEditCircularAlarmView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    var body: some View {
        VStack {
            CancelSaveAlarm(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
            
            AlarmToggleView(alarmEnabled: $alarmModel.alarmEnabled)
            
            Divider()
            
            Spacer()
            
            CircularTimeView(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel, size: screenWidth / 2)
            
            Spacer()
            
            SelectActivityViewExpanded(currentColorIndex: $alarmModel.colorIndex, currentActivity: $alarmModel.activity)
        }
        .padding()
    }
}

#Preview {
    AddEditCircularAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
}
