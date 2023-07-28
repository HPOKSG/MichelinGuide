//
//  MainView.swift
//  A1
//
//  Created by Hữu Phước  on 25/07/2023.
//

import SwiftUI

struct MainView: View {
    @State var theme: Theme = Theme(isLightTheme: true)
    var body: some View {
        TabView {
            FeatureView(theme: $theme)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                        .foregroundColor(.black)
            }
            ListView(theme: $theme)
                .tabItem {
                    Label("Feature", systemImage: "magnifyingglass")
                        .foregroundColor(.black)
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
