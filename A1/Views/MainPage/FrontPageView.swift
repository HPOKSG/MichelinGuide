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

struct FrontPageView: View {
    @Environment (\.scenePhase) private var scenePhase
    @State var isPresenting = true
    @Binding var restaurants:[Restaurant]
    var body: some View {
        if isPresenting{
            WelcomePageView(isPresenting: $isPresenting)
        }else{
            MainView(restaurants: $restaurants)
                
        }
    }
}

struct FrontPageView_Previews: PreviewProvider {
    static var previews: some View {
        FrontPageView(restaurants: .constant(Restaurant.allRestaurant))
    }
}
