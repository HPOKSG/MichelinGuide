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

struct ContactInformation: View {
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
    var body: some View {
        VStack(spacing: 20){
            Text("Contact Information")
                .frame(maxWidth:.infinity,alignment: .leading)
                .font(.system(size:20))
         
            Label(restaurant.phone, systemImage: "phone")
                    .frame(maxWidth: .infinity,alignment:.leading)
            
            Link(destination: URL(string:restaurant.websiteUrl)!) {
                Label(restaurant.websiteUrl, systemImage: "globe")
                .frame(maxWidth: .infinity,alignment:.leading)
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

struct ContactInformation_Previews: PreviewProvider {
    static var previews: some View {
        ContactInformation(restaurant: .constant(Restaurant.allRestaurant[0]),theme: .constant(Theme(isLightTheme: true)))
    }
}


