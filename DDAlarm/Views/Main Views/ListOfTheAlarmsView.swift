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
            ZStack {
                List {
                    ForEach(0..<alarmViewModels.count, id: \.self) { i in
                        let alarmModel = alarmViewModels[i]
                        
                        NavigationLink(destination: {
                            MainAddEditAlarmView(currentAlarmIndex: i, alarmModel: .DefaultAlarm())
                        }, label: {
                            AlarmRowView(model: alarmModel, i: i)
                        })
                    }
                }
                
                FourCoolCircles()
                    .opacity(0.3)
            }
            .navigationTitle("Alarm List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: {
                        MainAddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
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
