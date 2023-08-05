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
    
    //declare the variables
    @Binding var restaurants : [Restaurant]
    @State private var theme: Theme = Theme(isLightTheme: true)
    var body: some View {
        
        //use navigation stack between the main view
        //with the detail view of the restaurant
        NavigationStack {
            
            ZStack {
                theme.primaryColor
                    .edgesIgnoringSafeArea(.all)
                
                //use vstack to contain the main body
                VStack{
                    
                    //animate the transition between the light and dark theme
                    withAnimation {
                        Toggle("", isOn: $theme.isLightTheme)
                            .toggleStyle(SwitchToggleStyle())
                            .padding(.bottom)
                    }
                    
                    //create tab view to navigate between home and list view page
                    TabView {
                        
                        //display the feature view
                        FeatureView(restaurants: $restaurants, theme: $theme)
                            .tabItem {
                                Label("Home", systemImage: "house.fill")
                                    .foregroundColor(.blue)
                            }
                            .toolbarBackground(theme.primaryColor, for: .tabBar)
                        
                        //display the list view 
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
        .preferredColorScheme(theme.isLightTheme ? .light: .dark)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(restaurants: .constant(Restaurant.allRestaurant))
    }
}
