//
//  MainAlarmView.swift
//  DDAlarm
//
//  Created by joe on 3/6/25.
//

import SwiftUI

struct MainAlarmView: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    @Environment(\.scenePhase) var scenePhase
    
    // every time the scene phase changes this will update
    // use onChanged
    var body: some View {
        if #available(iOS 18.0, *) {
            if lnManager.isAuthorized {
                TabView {
                    Tab("Alarms", systemImage: "alarm.fill") {
                        ListOfTheAlarmsView(alarmViewModels: AlarmModel.DummyAlarmData())
                    }
                    
                    Tab("About", systemImage: "info.circle.fill") {
                        AboutView()
                    }
                }
                .ignoresSafeArea()
                .task {
                    try? await lnManager.requestAuthorization()
                }
                .onChange(of: scenePhase) { oldValue, newValue in
                    if newValue == .active {
                        Task {
                            await lnManager.getCurrentSettings()
                        }
                    }
                }
            } else {
                EnableNotifications()
            }
        } else {
            TabView {
                if lnManager.isAuthorized {
                    ListOfTheAlarmsView(alarmViewModels: AlarmModel.DummyAlarmData())
                        .tabItem {
                            Label("Alarms", systemImage: "alarm.fill")
                        }
                    
                    AboutView()
                        .tabItem {
                            Label("About", systemImage: "info.circle.fill")
                        }
                } else {
                    EnableNotifications()
                }
            }
            .ignoresSafeArea()
            .task {
                try? await lnManager.requestAuthorization()
            }
            .onChange(of: scenePhase) { oldValue, newValue in
                if newValue == .active {
                    Task {
                        await lnManager.getCurrentSettings()
                    }
                }
            }
        }
    }
}

#Preview {
    MainAlarmView()
}
