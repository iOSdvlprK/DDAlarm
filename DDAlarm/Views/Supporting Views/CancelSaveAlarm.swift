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
    
    var body: some View {
        HStack {
            // cancel
            Button(action: {
                print("Cancel - todo")
            }, label: {
                Text("Cancel")
            })
            
            Spacer()
            
            // save
            Button(action: {
                print("Save - todo")
                if let currentAlarmIndex = currentAlarmIndex {
                    // TODO: edit alarm to view model
                    print("\(currentAlarmIndex)")
                } else {
                    // TODO: append alarm to view model
                }
            }, label: {
                Text("Save")
            })
        }
    }
}

#Preview {
    CancelSaveAlarm(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm()))
}
