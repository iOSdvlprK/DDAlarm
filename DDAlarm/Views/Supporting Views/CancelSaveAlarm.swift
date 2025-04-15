//
//  CancelSaveAlarm.swift
//  DDAlarm
//
//  Created by joe on 3/19/25.
//

import SwiftUI

struct CancelSaveAlarm: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        HStack {
            // cancel
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
            })
            
            Spacer()
            
            // save
            Button(action: {
                print("Save - todo")
                if let currentAlarmIndex = currentAlarmIndex {
                    // save alarm
                    lnManager.alarmViewModels[currentAlarmIndex] = alarmModel
                } else {
                    lnManager.safeAppend(localNotification: alarmModel)
                }
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Text("Save")
            })
        }
    }
}

#Preview {
    CancelSaveAlarm(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm()))
        .environmentObject(LocalNotificationManager())
}
