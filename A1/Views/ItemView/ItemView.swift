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

struct ItemView: View {
    
    //declare the variables
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
    
    var body: some View {
        VStack(spacing:0){
            
            //create the image for the restaurant
            Image(restaurant.images[0])
                .resizable()
                .scaledToFill()
                .frame(width: 325,height: 200)
                .clipShape(CornerRadiusShape(radius: 10,corners: [.topLeft,.topRight]))
            
            //create botom section for the brief restaurant's informaiton
            BottomCardView(restaurant: $restaurant, theme: $theme)
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(restaurant: .constant(Restaurant.allRestaurant[1]), theme: .constant(Theme(isLightTheme: false)))
        
    }
}

//customize to have curvy effect on only specify corner of the image
struct CornerRadiusShape: Shape{
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners
    
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct BottomCardView: View {
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
    var body: some View {
        ZStack {
            theme.secondaryColor
                .frame(width: 325,height: 124)
                .clipShape(CornerRadiusShape(radius: 10,corners:[.bottomLeft,.bottomRight]))
            VStack (spacing: 0){
                HStack {
                    
                    Text(restaurant.name.uppercased())
                        .foregroundColor(theme.accentColor)
                        .padding(.leading)
                        .bold()
                    
                    
                    Spacer()
                    if let image = restaurant.icon{
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .padding(.trailing)
                    }
                    
                }
                .frame(width:325)
                Text(restaurant.quickReview)
                    .foregroundColor(theme.accentColor)
                    .font(.caption)
                    .frame(width: 310,alignment: .leading)
                    .padding(.leading)
                HStack{
                    Text("Price: \(restaurant.priceRange)")
                        .foregroundColor(theme.accentColor)
                        .padding(.leading)
                    Spacer()
                    Button(action: {
                        withAnimation {
                            restaurant.isFavorite = restaurant.isFavorite == true ? false : true
                        }
                        
                        
                    }) {
                        Image(systemName:restaurant.isFavorite ?"heart.fill":  "heart")
                            .padding(.trailing)
                        
                            .foregroundColor( restaurant.isFavorite ? Color("red") : theme.isLightTheme ? .black : .white)
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
