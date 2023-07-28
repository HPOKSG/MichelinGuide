//
//  ItemView.swift
//  A1
//
//  Created by Hữu Phước  on 24/07/2023.
//

import SwiftUI

struct ItemView: View {
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
    var body: some View {
        VStack(spacing:0){
            Image(restaurant.images[0])
                .resizable()
                .scaledToFill()
                .frame(width: 325,height: 200)
                .clipShape(CornerRadiusShape(radius: 10,corners: [.topLeft,.topRight]))
            
            ZStack {
                Color.white
                    .frame(width: 325,height: 124)
                .clipShape(CornerRadiusShape(radius: 10,corners:[.bottomLeft,.bottomRight]))
                VStack (spacing: 0){
                    HStack {
                      
                        Text(restaurant.name.uppercased())
                            .foregroundColor(.black)
                            .padding(.leading)
                        .bold()
                        
                       
                        Spacer()
                        restaurant.icon
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .padding(.trailing)
                    }
                    .frame(width:325)
                    Text(restaurant.quickReview)
                        .foregroundColor(.black)
                        .font(.caption)
                        .frame(width: 310,alignment: .leading)
                        .padding(.leading)
                    HStack{
                        Text("Price: \(restaurant.priceRange)")
                            .foregroundColor(.black)
                            .padding(.leading)
                        Spacer()
                        Button(action: {
                            restaurant.isFavorite = restaurant.isFavorite == true ? false : true
                            
                        }) {
                            Image(systemName: restaurant.isFavorite ? "heart.fill": "heart")
                                .padding(.trailing)
                                .foregroundColor( restaurant.isFavorite ? Color("red") : .black)
                                .font(.title2)
                        }
                    }
                    .offset(y:8)
                    .frame(width:325)
                    .font(.caption)
                }
               
            }
                
            
        }
       
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(restaurant: .constant(Restaurant.oneStarRestaurants[1]), theme: .constant(Theme(isLightTheme: true)))
        
    }
}


struct CornerRadiusShape: Shape{
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners
    
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
                return Path(path.cgPath)
    }
}
