//
//  EnableNotifications.swift
//  DDAlarm
//
//  Created by joe on 3/15/25.
//

import SwiftUI

struct EnableNotifications: View {
    var body: some View {
        ZStack {
            FourCoolCircles()
            VStack {
                Spacer()
                CoolTextView(
                    text: LocalizedStringKey("Enable notifications, please"),
                    size: 48
                )
                .multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                    // TODO: enable
                }, label: {
                    ButtonView(text: "enable")
                        .padding()
                })
            }
        }
    }
}

#Preview {
    EnableNotifications()
}
