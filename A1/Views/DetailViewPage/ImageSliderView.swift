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

struct ImageSliderView: View {
    
    //declare the variable
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
    var body: some View {
        
        ScrollView (.horizontal,showsIndicators: false) {
            
            //use HSTACK make the set of image for the according restaurant
            HStack() {
                ForEach(0...restaurant.images.count-1,id: \.self) { index in
                    Image(restaurant.images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 375,height: 300)
                        .clipped()
                        .clipShape(CornerRadiusShape(radius: 20))
                        .overlay {
                            Text("\(index+1) / \(restaurant.images.count)")
                                .foregroundColor(theme.accentColor)
                                .font(.system(size:14))
                                .frame(width: 45,height:20 )
                                .background(theme.primaryColor)
                                .clipShape(Capsule())
                                .frame(width: 375,height: 300,alignment: .bottomTrailing)
                                .padding([.trailing,.bottom])
                        }
                        .offset(x: 7)
                }
            }
        }
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView(restaurant: .constant(Restaurant.allRestaurant[0]),theme: .constant(Theme(isLightTheme: true)))
    }
}
