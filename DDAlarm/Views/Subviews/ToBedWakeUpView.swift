//
//  ToBedWakeUpView.swift
//  DDAlarm
//
//  Created by joe on 3/18/25.
//

import SwiftUI

struct ToBedWakeUpView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    var body: some View {
        VStack {
            CancelSaveAlarm(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
            
            AlarmToggleView(alarmEnabled: $alarmModel.alarmEnabled)
            
            Divider()
            
            HStack {
                Grid {
                    GridRow {
                        TimeOfDayIcon(date: alarmModel.start)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            GrayedTextView(text: "start")
                            
                            TimePicker(time: $alarmModel.start, scale: 1.3)
                        }
                    }
                    
                    GridRow {
                        HStack {
                            Divider()
                                .frame(height: 30)
                                .padding(2)
                        }
                    }
                    
                    GridRow {
                        Image(systemName: alarmModel.activity)
                            .foregroundStyle(alarmModel.activityColor)
                            .font(.headline)
                        
                        SelectActivityView(currentColorIndex: $alarmModel.colorIndex, currentActivity: $alarmModel.activity)
                    }
                    .padding(.vertical)
                    
                    GridRow {
                        HStack {
                            Divider()
                                .frame(height: 30)
                                .padding(2)
                        }
                    }
                    
                    GridRow {
                        TimeOfDayIcon(date: alarmModel.end)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            TimePicker(time: $alarmModel.end, scale: 1.3)
                            
                            GrayedTextView(text: "end")
                            
                        }
                    }
                    
                    GridRow {
                        Text("")
                        
                        // sound button
                        Menu(content: {
                            ForEach(Sounds.allCases, id: \.self) { sound in
                                Button(action: {
                                    alarmModel.sound = sound
                                }, label: {
                                    Text(sound.rawValue)
                                })
                            }
                            .padding(.vertical)
                        }, label: {
                            HStack {
                                Text("Sound")
                                    .fontWeight(.semibold)
                                
                                Text(alarmModel.sound.rawValue)
                                    .font(.caption)
                                    .fontWeight(.thin)
                            }
                            .padding(7)
                            .overlay {
                                Capsule()
                                    .stroke()
                            }
                        })
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .padding()
        .background {
            cardBackgroundColor
                .clipShape(.rect(cornerRadius: 20))
        }
        .padding()
    }
}

#Preview {
    ToBedWakeUpView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
}
