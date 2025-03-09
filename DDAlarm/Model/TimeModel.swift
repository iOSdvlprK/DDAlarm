//
//  TimeModel.swift
//  DDAlarm
//
//  Created by joe on 3/9/25.
//

import Foundation

struct TimeModel: Equatable, Comparable, Identifiable {
    let id = UUID()
    let hours: Int
    let minutes: Int
    
    static func < (lhs: TimeModel, rhs: TimeModel) -> Bool {
        (lhs.hours < rhs.hours) || (lhs.hours == rhs.hours && lhs.minutes < rhs.minutes)
    }
}
