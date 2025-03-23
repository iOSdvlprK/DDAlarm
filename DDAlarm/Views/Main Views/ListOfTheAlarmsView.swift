//
//  ListOfTheAlarmsView.swift
//  DDAlarm
//
//  Created by joe on 3/23/25.
//

import SwiftUI

struct ListOfTheAlarmsView: View {
    var alarmViewModels: [AlarmModel]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<alarmViewModels.count, id: \.self) { i in
                    let alarmModel = alarmViewModels[i]
                    
                    NavigationLink(destination: {
                        Text("Data for alarm \(i)")
                    }, label: {
                        HStack {
                            Image(systemName: alarmModel.activity)
                                .foregroundStyle(alarmModel.activityColor)
                            Text("Alarm Row View - Edit me")
                        }
                    })
                }
            }
            .navigationTitle("Alarm List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: {
                        Text("Create new alarm")
                    }, label: {
                        Text("+")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(black)
                    })
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }
    }
}

#Preview {
    ListOfTheAlarmsView(alarmViewModels: AlarmModel.DummyAlarmData())
}
