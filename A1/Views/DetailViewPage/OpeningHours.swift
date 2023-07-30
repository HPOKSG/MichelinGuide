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

struct OpeningHours: View {
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
    var daysInWeek = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    var body: some View {
        VStack(spacing: 20){
            Text("Opening Hours")
                .frame(maxWidth:.infinity,alignment: .leading)
                .font(.system(size:20))
            
            if let schedule =  restaurant.openingHour{
                ForEach(daysInWeek,id: \.self){ key in
                    HStack{
                        Text(key)
                        Spacer()
                        VStack {
                            ForEach(schedule[key]!.split(separator: " "),id: \.self){ time in
                                Text(time)
                            }
                        }
                       
                    }
                    .padding(.horizontal)
                    .padding(.horizontal)
                    
                }
            }
            
        }
        .foregroundColor(theme.accentColor)
        .bold()
        .foregroundColor(.black)
        .lineSpacing(5)
        .padding(.all)
        .background(theme.secondaryColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.all)
    }
}

struct OpeningHours_Previews: PreviewProvider {
    static var previews: some View {
        OpeningHours(restaurant: .constant(Restaurant.allRestaurant[0]),theme: .constant(Theme(isLightTheme: true)))
    }
}
