//
//  LocalNotificationManager.swift
//  DDAlarm
//
//  Created by joe on 4/4/25.
//

import Foundation
import NotificationCenter

@MainActor
class LocalNotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()
    @Published var isAuthorized = false
    
    // store a list of notifications/alarms
    @Published var pendingAlarms: [UNNotificationRequest] = []
    
    // view model for AlarmModel
    @Published var alarmViewModels: [AlarmModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemKey = "Alarm List"
    
    func requestAuthorization() async throws {
        try await notificationCenter
            .requestAuthorization(options: [
                .sound, .badge, .alert
            ])
        
        await getCurrentSettings()
    }
    
    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        
        isAuthorized = currentSettings.authorizationStatus == .authorized
    }
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                Task {
                    await UIApplication.shared.open(url)                    
                }
            }
        }
    }
    
    // save state for alarm view model
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(alarmViewModels) {
            UserDefaults.standard.set(encodeData, forKey: itemKey)
        }
    }
    
    override init() {
        super.init()
        // TODO: want alarm to go off when app is also active
        
        // alarm view model - persistance
        guard let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([AlarmModel].self, from: data)
        else { return }
        self.alarmViewModels = savedItems
    }
    
    func getPendingAlarms() async {
        pendingAlarms = await notificationCenter.pendingNotificationRequests()
    }
    
    func schedule(localNotification: AlarmModel) async {
        let content = UNMutableNotificationContent()
        content.body = NSLocalizedString(localNotification.body, comment: "")
        
        content.sound = customSound(soundName: localNotification.sound)
        
        let dateComponents = localNotification.endDateComponents
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: localNotification.repeats)
        
        let request = UNNotificationRequest(
            identifier: localNotification.id,
            content: content,
            trigger: trigger
        )
        
        // add request
        try? await notificationCenter.add(request)
        
        pendingAlarms = await notificationCenter.pendingNotificationRequests()
        
    }
    
    func customSound(soundName: Sounds, fileExtension: String = "") -> UNNotificationSound? {
        let period = fileExtension.isEmpty ? "" : "."
        let filename = "\(soundName.rawValue)\(period)\(fileExtension)"
        
        return UNNotificationSound(named: UNNotificationSoundName(rawValue: filename))
    }
}
