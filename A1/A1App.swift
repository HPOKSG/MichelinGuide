//
//  A1App.swift
//  A1
//
//  Created by Hữu Phước  on 24/07/2023.
//

import SwiftUI

@main
struct A1App: App {
    @StateObject var vm : LocationViewModel = LocationViewModel()
    @StateObject var restaurants : RestaurantViewModel = RestaurantViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(vm)
                .environmentObject(restaurants)
        }
    }
}
