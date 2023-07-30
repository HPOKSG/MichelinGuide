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

struct POVView: View {
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
   
    var body: some View {
        VStack{
            Text("MICHELIN Guide’s Point Of View")
                .frame(maxWidth:.infinity,alignment: .leading)
                .font(.system(size:20))
            HStack{
                Image("star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                Text("High quality cooking, worth a stop!")
            }
            .font(.system(size: 16))
            .frame(maxWidth: .infinity,alignment:.leading)
           

            Text(restaurant.introduction)
                .font(.system(size: 14))
                .padding(.top)
               
        }
        .foregroundColor(theme.accentColor)
        .bold()
        .lineSpacing(5)
        .padding(.all)
        .background(theme.secondaryColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.all)
    }
}

struct POVView_Previews: PreviewProvider {
    static var previews: some View {
        POVView(restaurant: .constant(Restaurant.allRestaurant[0]),theme: .constant(Theme(isLightTheme: false)))
    }
}
