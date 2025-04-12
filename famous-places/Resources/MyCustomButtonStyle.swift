//
//  MyCustomButtonStyle.swift
//  famous-places
//
//  Created by HaYen on 8/4/25.
//

import SwiftUI

struct MyCustomButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 8)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(6)
        }
}
