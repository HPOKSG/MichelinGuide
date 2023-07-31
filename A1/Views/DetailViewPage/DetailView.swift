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

struct DetailView: View {
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
    var body: some View {
        ZStack{
            theme.primaryColor
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    ImageSliderView(restaurant: $restaurant, theme: $theme)
                    VStack{
                     
                            HStack{
                                Text(restaurant.name.uppercased()) // display restaurant name
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(theme.accentColor)
                                restaurant.icon
                            }
                            .frame(width:375,alignment: .leading)
                        .padding(.leading)
                        
                        
                        POVView(restaurant: $restaurant, theme: $theme)
                        ServiceView(theme: $theme)
                        if let _ = restaurant.openingHour{
                            OpeningHours(restaurant: $restaurant, theme: $theme)
                        }
                        ContactInformation(restaurant: $restaurant, theme: $theme)
                        
                        Text("Location") // display restaurant name
                            .font(.title)
                            .bold()
                            .foregroundColor(theme.accentColor)
                        MappingView(restaurant: $restaurant)
        
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(restaurant: .constant(Restaurant.allRestaurant[0])
                   ,theme: .constant(Theme(isLightTheme: false)))
        
    }
}
