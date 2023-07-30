/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Dinh Gia Huu Phuoc
  ID: s3878270
  Created  date: 25/07/2023
  Last modified: 02/08/2023
  Acknowledgement: COSC2659 Lecture Slides, Apple IOS Development Tutorial
*/
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
