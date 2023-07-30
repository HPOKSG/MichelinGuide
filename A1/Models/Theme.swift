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
