//
//  ButtonView.swift
//  DDAlarm
//
//  Created by joe on 3/15/25.
//

import SwiftUI

struct ButtonView: View {
    let text: LocalizedStringKey
    var endRadius = 40.0
    var scaleX = 3.0
    
    var body: some View {
        Text(text)
            .foregroundStyle(black)
            .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                MainGradient(endRadius: endRadius, scaleX: scaleX)
                    .clipShape(.rect(cornerRadius: 30))
            }
    }
}

#Preview {
    VStack {
        ButtonView(text: "add alarm")
        ButtonView(text: "next")
        ButtonView(text: "create")
    }
    .padding()
}
