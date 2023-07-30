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

struct FeatureView: View {
    @Binding var restaurants: [Restaurant]
    @Binding var theme: Theme
    var body: some View {
        ZStack{
            theme.primaryColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView{
                    VStack{
                        ItemRowView(title: "Recommend", symbol: "", type: .recommend, restaurants: $restaurants, theme: $theme)
                            .padding(.vertical)
                        Divider()
                            .overlay(theme.accentColor)
                        ItemRowView(title: "Bib Gourmand", symbol: "bib", type: .bib, restaurants: $restaurants, theme: $theme)
                            .padding(.vertical)
                        Divider()
                            .overlay(theme.accentColor)
                        ItemRowView(title: "1 Star Michelin", symbol: "star", type: .oneStart, restaurants: $restaurants, theme: $theme)
                            .padding(.vertical)
                    }
                }
            }
        }
        
    }
}


struct Feature_Previews: PreviewProvider {
    static var previews: some View {
        FeatureView(restaurants: .constant(Restaurant.allRestaurant), theme: .constant(Theme(isLightTheme: true)))
            .environmentObject(LocationViewModel())
    }
}
