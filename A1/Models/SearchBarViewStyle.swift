//
//  SearchBarViewStyle.swift
//  A1
//
//  Created by Hien Vo Tran Minh on 28/07/2023.
//

import Foundation
import SwiftUI

struct TextFieldStyleView: TextFieldStyle {
    
    let systemImageString: String
    
    // Hidden function to conform to this protocol
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(.white)
                .frame(height: 40)
                .background(.white)
            
            HStack {
                Image(systemName: systemImageString)
                // Reference the TextField here
                configuration
            }
            .padding(.leading)
            .foregroundColor(.gray)
        }
    }
}

