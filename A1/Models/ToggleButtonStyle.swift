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

struct SwitchToggleStyle: ToggleStyle {
    
    //declare the name of the image to fed in the toggle button
    var night = "night"
    var day = "day"
    
    func makeBody(configuration: Configuration) -> some View {
        
        //create the frame for the toggle button
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 80,height: 35)
            .foregroundColor(!configuration.isOn ? .black : Color(.systemGray5))
            .overlay {
                
                //customize the image based on the dark or light mode
                Image(configuration.isOn ? day : night)
                    .resizable()
                    .aspectRatio(contentMode: .fill )
                    .frame(width: 55)
                    .clipShape(Circle())
                    .rotationEffect(.degrees(configuration.isOn ? 0 : -360))
                    .offset(x: configuration.isOn ? -30 : 30)
            }
            .frame(width: 45, height: 32)
            .onTapGesture {
                withAnimation(.spring()) {
                    configuration.isOn.toggle()
                }
            }
    }
}
