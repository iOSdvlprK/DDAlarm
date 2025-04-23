//
//  AlarmRowView.swift
//  DDAlarm
//
//  Created by joe on 3/24/25.
//

import SwiftUI

struct AlarmRowView: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    let model: AlarmModel
    let i: Int
    
    var body: some View {
        HStack {
            Image(systemName: model.activity)
                .foregroundStyle(model.activityColor)
                .font(.title)
            
            Spacer()
            
            Text("\(getTimeFromDate(date: model.start))-\(getTimeFromDate(date: model.end))")
                .font(.title)
                .fontWeight(model.alarmEnabled ? .regular : .thin)
                .scaleEffect(model.alarmEnabled ? 1.05 : 1.0)
                .opacity(model.alarmEnabled ? 1.0 : 0.7)
            
            Spacer()
            
            if i < lnManager.alarmViewModels.count {
                TheToggleView(isOn: .constant(lnManager.alarmViewModels[i].alarmEnabled))
            }
        }
        .onChange(of: model.alarmEnabled) { _, alarmEnabled in
            if alarmEnabled {
                print("Enable alarm")
                Task {
                    await lnManager.schedule(localNotification: model)
                }
            } else {
                print("Disable alarm")
                lnManager.removeRequest(id: model.id)
            }
        }
    }
}

#Preview {
    AlarmRowView(model: .DefaultAlarm(), i: 0)
        .environmentObject(LocalNotificationManager())
}
