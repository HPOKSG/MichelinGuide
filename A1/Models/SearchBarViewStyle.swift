//
//  SearchBarViewStyle.swift


import Foundation
import SwiftUI

struct TextFieldStyleView: TextFieldStyle {
    let theme: Theme
    let systemImageString: String

    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(theme.secondaryColor)
                .frame(height: 40)
                .background(theme.secondaryColor)
            HStack {
                Image(systemName: systemImageString)
                // Reference the TextField here
                configuration
                    .foregroundColor(theme.accentColor)
            }
            .padding(.leading)
        }
    }
}



