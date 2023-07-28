//
//  NavigationItemView.swift
//  A1
//
//  Created by Hữu Phước  on 28/07/2023.
//

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
