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
    
    //declare the variables
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
    var body: some View {
        ZStack{
            
            //make the background color
            theme.primaryColor
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                
                VStack{
                    //add the set of image according to the restaurant
                    ImageSliderView(restaurant: $restaurant, theme: $theme)
                    
                    VStack{
                        
                        // display restaurant name
                        HStack{
                            Text(restaurant.name.uppercased())
                                .font(.title)
                                .bold()
                                .foregroundColor(theme.accentColor)
                            restaurant.icon
                        }
                        .frame(width:375,alignment: .leading)
                        .padding(.leading)
                        
                        //create the point of info section
                        POVView(restaurant: $restaurant, theme: $theme)
                        
                        //create the service info section
                        ServiceView(theme: $theme)
                        
                        //create the schedule information of the restaurant
                        //if it's available
                        if let _ = restaurant.openingHour{
                            OpeningHours(restaurant: $restaurant, theme: $theme)
                        }
                        
                        //create the contact information section
                        ContactInformation(restaurant: $restaurant, theme: $theme)
                        
                        Text("Location")
                            .font(.title)
                            .bold()
                            .foregroundColor(theme.accentColor)
                        
                        //create the mapping view
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
