//
//  A1App.swift
//  A1
//
//  Created by Hữu Phước  on 24/07/2023.
//

import SwiftUI

@main
struct A1App: App {
    @Environment (\.scenePhase) private var scenePhase
    @State var firstLaunch = true
    @StateObject var store =  RestaurantStore()
    var body: some Scene {
        WindowGroup {
            FrontPageView(restaurants: $store.restaurants)
            .onAppear() {
                store.load()
            }
        }
    }
}
