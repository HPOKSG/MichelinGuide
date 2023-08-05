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

// this struct is to control the theme color of the app
struct Theme {
    var isLightTheme: Bool
    
    
    var description: String {
        return isLightTheme ? "Light Mode":"Dark Mode"
    }
    
    //this is color is used for text
    var accentColor: Color {
        return isLightTheme ? Color.black : .white
    }
    
    // this color is used for the background
    var primaryColor: Color{
        return isLightTheme ? Color("background") :.black
    }
    
    // this color is used for the card
    var secondaryColor: Color{
        return isLightTheme ? Color(.white) : Color("secondary-dark");
    }
    
}
