//
//  SwitchButtonView.swift
//  A1
//
//  Created by Hữu Phước  on 29/07/2023.
//

import SwiftUI

struct SwitchButtonView: View {
    let day = "day"
    let night = "night"
    @Binding  var theme: Theme
    var body: some View {
        
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 80,height: 35)
                .foregroundColor(!theme.isLightTheme ? .black : Color(.systemGray5))
                .overlay {
                    Image(theme.isLightTheme ? day : night)
                        .resizable()
                        .aspectRatio(contentMode: .fill )
                        .frame(width: 55)
                        .clipShape(Circle())
                        .rotationEffect(.degrees(theme.isLightTheme ? 0 : -360))
                        .offset(x: theme.isLightTheme ? -30 : 30)
                }
                .frame(width: 45, height: 32)
                .onTapGesture {
                    withAnimation(.spring()) {
                        theme.isLightTheme.toggle()
                    }
                }
        

        
    }
}

struct SwitchButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchButtonView(theme: .constant(Theme(isLightTheme: true)))
    }
}
