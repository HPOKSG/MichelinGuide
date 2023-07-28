//
//  ListView.swift
//  A1
//
//  Created by Hien Vo Tran Minh on 28/07/2023.
//

import SwiftUI

struct ListView: View {
    @State var restaurantName: String = ""
    @Binding var restaurants: [Restaurant]
    @Binding var theme: Theme
    var body: some View {
        ZStack{
            theme.mainColor
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVStack (spacing: 20) {
                    TextField("Name of the restaurant...", text: $restaurantName)
                        .textFieldStyle(TextFieldStyleView(systemImageString: "magnifyingglass"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    ForEach($restaurants,id: \.id) { $restaurant in
                        ItemView(restaurant: $restaurant, theme: $theme)
                    }
                    
                }
            }
            
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(restaurants:.constant(Restaurant.allRestaurant), theme: .constant(Theme(isLightTheme: true)))
    }
}



