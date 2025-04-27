//
//  ImageDisplayView.swift
//  DDAlarm
//
//  Created by joe on 4/27/25.
//

import SwiftUI

struct ImageDisplayView: View {
    let name: String
    let width: CGFloat
    
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: width)
    }
}

#Preview {
    HStack {
        ImageDisplayView(name: standardViewImage, width: 50)
        
        Spacer()
        
        ImageDisplayView(name: circularViewImage, width: 50)
    }
    .padding()
}
