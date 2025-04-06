//
//  Sound Constants.swift
//  DDAlarm
//
//  Created by joe on 3/10/25.
//

import Foundation

enum Sounds: String, CaseIterable, Codable {
    case wake_up = "Sound Wake up"
    case lagrima = "Lagrima"
    
    func formatSoundName() -> String {
        String(describing: self)
            .replacingOccurrences(of: "_", with: " ")
            .capitalized
    }
}
