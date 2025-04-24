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
//    @State var addEditViewType: AddEditViewType = .standard
    @State var addEditViewType: AddEditViewType = .circular
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(lnManager.alarmViewModels.indices, id: \.self) { i in
                        AlarmRowViewButton(model: lnManager.alarmViewModels[i], i: i, currentIndex: $currentIndex, isActive: $isActive)
                            .padding(.vertical)
                    }
                    .onDelete(perform: deleteMe)
                }
                
                FourCoolCircles()
                    .opacity(0.3)
            }
            .navigationTitle("Alarm List")
            .sheet(isPresented: $isActive) {
                // edit the currentIndex alarm
                ChooseAlarmView(currentAlarmIndex: $currentIndex, addEditViewType: addEditViewType)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isActive.toggle()
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
            print("Remove request from \(lnManager.alarmViewModels[index].id)")
            lnManager.removeRequest(id: lnManager.alarmViewModels[index].id)
        }
        
        // Removing from alarmViewModel
        lnManager.alarmViewModels.remove(atOffsets: offsets)
    }
}

#Preview {
    ListOfTheAlarmsView()
        .environmentObject(LocalNotificationManager())
}
