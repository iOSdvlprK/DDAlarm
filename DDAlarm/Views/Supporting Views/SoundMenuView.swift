//
//  SoundMenuView.swift
//  DDAlarm
//
//  Created by joe on 4/10/25.
//

import SwiftUI

struct SoundMenuView: View {
    @Binding var alarmSound: Sounds
    
    var body: some View {
        Form {
            Section(header: Text("Ringtone Sounds")) {
                ForEach(ringToneSoundsList, id: \.self) { sound in
                    Button(action: {
                        // change current sound
                        alarmSound = sound
                        
                        // play sound
                        playSound(sound: sound.rawValue)
                    }, label: {
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundStyle(purple)
                                .fontWeight(.semibold)
                                .opacity(alarmSound == sound ? 1.0 : 0.0)
                            
                            Text(sound.rawValue.formatSoundName)
                                .foregroundStyle(black)
                                .fontWeight(.semibold)
                        }
                    })
                }
            }
            
            Section(header: Text("Sounds of Nature")) {
                ForEach(natureSoundsList, id: \.self) { sound in
                    Button(action: {
                        // change current sound
                        alarmSound = sound
                        
                        // play sound
                        playSound(sound: sound.rawValue)
                    }, label: {
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundStyle(purple)
                                .fontWeight(.semibold)
                                .opacity(alarmSound == sound ? 1.0 : 0.0)
                            
                            Text(sound.rawValue.formatSoundName)
                                .foregroundStyle(black)
                                .fontWeight(.semibold)
                        }
                    })
                }
            }
        }
        .onDisappear {
            // stop playing music once we leave the view
            stopPlaying()
        }
    }
}

struct SoundMenuViewFromButton: View {
    @Binding var alarmModel: AlarmModel
    
    var body: some View {
        NavigationLink(destination: {
            SoundMenuView(alarmSound: $alarmModel.sound)
        }, label: {
            HStack {
                Text("Sound")
                    .fontWeight(.semibold)
                Text(alarmModel.sound.rawValue.formatSoundName)
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

#Preview {
//    SoundMenuView(alarmSound: .constant(AlarmModel.DefaultAlarm().sound))
    NavigationStack {
        SoundMenuViewFromButton(alarmModel: .constant(AlarmModel.DefaultAlarm()))
    }
}
