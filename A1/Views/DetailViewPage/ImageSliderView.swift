//
//  ImageSliderView.swift
//  A1
//
//  Created by Hữu Phước  on 27/07/2023.
//

import SwiftUI

struct ImageSliderView: View {
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
    var body: some View {
        ScrollView (.horizontal,showsIndicators: false) {
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
