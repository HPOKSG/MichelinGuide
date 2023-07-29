//
//  Color.swift
//  A1
//
//  Created by Hữu Phước  on 25/07/2023.
//

import SwiftUI


struct Theme {
    var isLightTheme: Bool
    var description: String {
        return isLightTheme ? "Light Mode":"Dark Mode"
    }
    var accentColor: Color {
        return isLightTheme ? Color.black : .white
    }
    var primaryColor: Color{
        return isLightTheme ? Color("background") :.black
    }
    
    var secondaryColor: Color{
        return isLightTheme ? Color(.white) : Color("secondary-dark");
    }
    
}
