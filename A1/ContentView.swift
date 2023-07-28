//
//  ContentView.swift
//  A1
//
//  Created by Hữu Phước  on 24/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
//            ForEach(Restaurant.allRestaurant,id:\.id) { item in
            Text(Restaurant.allRestaurant[0].name)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
