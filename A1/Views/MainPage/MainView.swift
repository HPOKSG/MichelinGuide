//
//  MainView.swift
//  A1
//
//  Created by Hữu Phước  on 25/07/2023.
//

import SwiftUI

struct MainView: View {
    @State var theme: Theme = Theme(isLightTheme: true)
    @State var recRestaurants: [Restaurant] = Restaurant.recRestaurants
    @State var bibRestaurants: [Restaurant] = Restaurant.bibRestaurants
    @State var oneStartRestaurants: [Restaurant] = Restaurant.oneStarRestaurants
    var body: some View {
        NavigationStack{
            ZStack{
                theme.mainColor
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        ItemRowView(title: "Recommend".uppercased(), symbol: "none", restaurants: $recRestaurants, theme: $theme)
                        ItemRowView(title: "Bib Gourmand".uppercased(), symbol: "bib", restaurants: $bibRestaurants, theme: $theme)
                        ItemRowView(title: "One Star Michelin".uppercased(), symbol: "star", restaurants: $oneStartRestaurants, theme: $theme)
                    }
                }
            }
        }
    }
   
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(theme: Theme(isLightTheme: true))
            .environmentObject(LocationViewModel())
    }
}
