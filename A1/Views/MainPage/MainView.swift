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

struct MainView: View {
    @Binding var restaurants : [Restaurant]
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
                                Label("Home", systemImage: "house.fill")
                                    .foregroundColor(.blue)
                        }
                            .toolbarBackground(theme.primaryColor, for: .tabBar)
                           
                        ListView( restaurants: $restaurants, theme: $theme)
                            .tabItem {
                                Label("Feature", systemImage: "magnifyingglass")
                                    .foregroundColor(theme.accentColor)
                        }
                            .toolbarBackground(theme.primaryColor, for: .tabBar)
                    }
                    
                }
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(restaurants: .constant(Restaurant.allRestaurant))
            .environmentObject(LocationViewModel())
    }
}
