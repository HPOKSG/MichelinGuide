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

import Foundation
import SwiftUI

// this struct is to customize the text field
// purpose is used for search bar
struct TextFieldStyleView: TextFieldStyle {
    let theme: Theme
    let systemImageString: String
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            
            //create the frame for the search bar.
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(theme.secondaryColor)
                .frame(height: 40)
                .background(theme.secondaryColor)
            
            // add the icon to the search bar
            HStack {
                Image(systemName: systemImageString)
                    .foregroundColor(theme.accentColor)
                
            // Reference the TextField here
                configuration
                    .foregroundColor(theme.accentColor)
            }
            .padding(.leading)
        }
    }
}



