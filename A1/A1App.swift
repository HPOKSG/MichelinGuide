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
    @StateObject var vm : LocationViewModel = LocationViewModel()
    @StateObject var store =  RestaurantStore()
    var body: some Scene {
        WindowGroup {
            FrontPageView(restaurants: $store.restaurants){
                Task{
                    do{
                        try await store.save(restaurants: store.restaurants)
                    }catch{
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do{
                    try await store.load()
                }catch{
                    fatalError(error.localizedDescription)
                }
            }
            .environmentObject(vm)
        }
    }
}
