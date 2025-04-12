//
//  ListOfTheAlarmsView.swift
//  DDAlarm
//
//  Created by joe on 3/23/25.
//

import SwiftUI

struct ListOfTheAlarmsView: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    @State var isActive = false
    @State var currentIndex: Int? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(lnManager.alarmViewModels.indices, id: \.self) { i in
                        Button(action: {
                            currentIndex = i
                            isActive.toggle()
                        }, label: {
                            AlarmRowView(model: lnManager.alarmViewModels[i], i: i)
                                .padding(.vertical)
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
    
    func deleteMe(offsets: IndexSet) {
        // remove from pending alarms
        for index in offsets {
            // TODO: remove request for given id
            print("Remove request from \(lnManager.alarmViewModels[index].id)")
        }
        
        // TODO: next remove from the alarmViewModel
        print("Removing from alarmViewModels")
    }
}

#Preview {
    ListOfTheAlarmsView()
        .environmentObject(LocalNotificationManager())
}
