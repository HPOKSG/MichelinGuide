//
//  A1App.swift
//  A1
//
//  Created by Hữu Phước  on 24/07/2023.
//

import SwiftUI

@main
struct A1App: App {
    @EnvironmentObject var vm : LocationViewModel
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(vm)
        }
    }
}
