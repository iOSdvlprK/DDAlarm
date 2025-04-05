//
//  DDAlarmApp.swift
//  DDAlarm
//
//  Created by joe on 3/6/25.
//

import SwiftUI

@main
struct DDAlarmApp: App {
    @StateObject var lnManager = LocalNotificationManager()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(lnManager)
        }
    }
}
