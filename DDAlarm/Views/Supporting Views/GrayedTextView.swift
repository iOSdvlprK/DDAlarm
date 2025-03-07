//
//  GrayedTextView.swift
//  DDAlarm
//
//  Created by joe on 3/7/25.
//

import SwiftUI

struct GrayedTextView: View {
    let text: LocalizedStringKey
    var font = Font.headline
    
    var body: some View {
        Text(text)
            .foregroundStyle(.gray)
            .font(font)
    }
}

#Preview {
    GrayedTextView(text: "The UI for this nice Alarm app was largely inspired by the amazing work of Anton Leogky.")
}
