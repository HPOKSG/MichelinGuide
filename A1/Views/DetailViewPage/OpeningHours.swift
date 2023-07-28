//
//  OpeningHours.swift
//  A1
//
//  Created by Hữu Phước  on 27/07/2023.
//

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
                        Text(schedule[key]!)
                       
                    }
                    .padding(.horizontal)
                    .padding(.horizontal)
                    
                }
            }
            
        }
        .bold()
        .foregroundColor(.black)
        .lineSpacing(5)
        .padding(.all)
        .background(theme.mainColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.all)
    }
}

struct OpeningHours_Previews: PreviewProvider {
    static var previews: some View {
        OpeningHours(restaurant: .constant(Restaurant.oneStarRestaurants[0]),theme: .constant(Theme(isLightTheme: true)))
    }
}
