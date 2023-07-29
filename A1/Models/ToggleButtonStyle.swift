//
//  ToggleButtonStyle.swift
//  A1
//
//  Created by Hữu Phước  on 29/07/2023.
//

import Foundation
import SwiftUI

struct SwitchToggleStyle: ToggleStyle {
 
    var night = "night"
    var day = "day"
 
    func makeBody(configuration: Configuration) -> some View {
      RoundedRectangle(cornerRadius: 20)
        .frame(width: 80,height: 35)
        .foregroundColor(!configuration.isOn ? .black : Color(.systemGray5))
        .overlay {
            Image(configuration.isOn ? day : night)
                .resizable()
                .aspectRatio(contentMode: .fill )
                .frame(width: 55)
                .clipShape(Circle())
                .rotationEffect(.degrees(configuration.isOn ? 0 : -360))
                .offset(x: configuration.isOn ? -30 : 30)
        }
        .frame(width: 45, height: 32)
        .onTapGesture {
            withAnimation(.spring()) {
                configuration.isOn.toggle()
            }
        }
    
 
        
        
    }
}
