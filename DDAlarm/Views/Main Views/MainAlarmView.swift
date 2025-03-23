//
//  MainAlarmView.swift
//  DDAlarm
//
//  Created by joe on 3/6/25.
//

import SwiftUI

struct MainAlarmView: View {
    var body: some View {
        if #available(iOS 18.0, *) {
            TabView {
                Tab("Alarms", systemImage: "alarm.fill") {
                    AddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
                }
                
                Tab("About", systemImage: "info.circle.fill") {
                    AboutView()
                }
            }
        } else {
            TabView {
                AddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
                    .tabItem {
                        Label("Alarms", systemImage: "alarm.fill")
                    }
                
                AboutView()
                    .tabItem {
                        Label("About", systemImage: "info.circle.fill")
                    }
            }
        }
    }
}

#Preview {
    MainAlarmView()
}
