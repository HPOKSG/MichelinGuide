//
//  MainView.swift
//  A1
//
//  Created by Hữu Phước  on 25/07/2023.
//

import SwiftUI

struct MainView: View {
    @State private var restaurants : [Restaurant] = Restaurant.allRestaurant
    @State private var theme: Theme = Theme(isLightTheme: true)
    var body: some View {
        TabView {
            FeatureView(restaurants: $restaurants, theme: $theme)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                        .foregroundColor(.black)
            }
            ListView( restaurants: $restaurants, theme: $theme)
                .tabItem {
                    Label("Feature", systemImage: "magnifyingglass")
                        .foregroundColor(.black)
            }

        }
        
       
    }
   
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(LocationViewModel())
    }
}
