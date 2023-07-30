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

struct NavigationItemView: View {
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
    var body: some View {
        NavigationLink {
            DetailView(restaurant: $restaurant,theme: $theme)
            
        } label: {
            ItemView(restaurant: $restaurant,theme: $theme)
        }
    }
}

struct NavigationItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationItemView(restaurant: .constant(Restaurant.allRestaurant[0]), theme: .constant(Theme(isLightTheme: true)))
    }
}
