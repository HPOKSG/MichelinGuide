//
//  MainView.swift
//  A1
//
//  Created by Hữu Phước  on 25/07/2023.
//

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
                        ItemRowView(title: "Bib Gourmand", symbol: "bib", type: .bib, restaurants: $restaurants, theme: $theme)
                        ItemRowView(title: "1 Star Michelin", symbol: "star", type: .oneStart, restaurants: $restaurants, theme: $theme)
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
