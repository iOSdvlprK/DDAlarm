//
//  ChooseAlarmView.swift
//  DDAlarm
//
//  Created by joe on 4/22/25.
//

import SwiftUI

enum AddEditViewType {
    case standard, circular
}

struct ChooseAlarmView: View {
    @Binding var currentAlarmIndex: Int?
    @EnvironmentObject var lnManager: LocalNotificationManager
    let addEditViewType: AddEditViewType
    
    var body: some View {
        if let currentAlarmIndex = currentAlarmIndex {
            if addEditViewType == .standard {
                AddEditAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: lnManager.alarmViewModels[currentAlarmIndex])
            } else {
                AddEditCircularAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: lnManager.alarmViewModels[currentAlarmIndex])
            }
        } else {
            if addEditViewType == .standard {
                AddEditAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: .DefaultAlarm())
            } else {
                AddEditCircularAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: .DefaultAlarm())
            }
        }
    }
}

#Preview {
    ChooseAlarmView(currentAlarmIndex: .constant(nil), addEditViewType: .standard)
}
