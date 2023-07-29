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
        
        NavigationStack {
            ZStack {
                theme.primaryColor
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    withAnimation {
                            Toggle("", isOn: $theme.isLightTheme)
                                .toggleStyle(SwitchToggleStyle())
                            .padding(.bottom)
                    }
                    TabView {
                        FeatureView(restaurants: $restaurants, theme: $theme)
                            .tabItem {
                                Label("Menu", systemImage: "list.dash")
                                    .foregroundColor(theme.accentColor)
                        }
                        ListView( restaurants: $restaurants, theme: $theme)
                            .tabItem {
                                Label("Feature", systemImage: "magnifyingglass")
                                    .foregroundColor(theme.accentColor)
                        }
                    }
                }
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
