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

struct ItemRowView: View {
    let title: String
    let symbol: String
    let type : Restaurant.Filter
    @Binding var restaurants: [Restaurant]
    @Binding var theme: Theme

    @State var isPresenting = false

    var body: some View {
        VStack {
            HStack{
                Text(title)
                    .foregroundColor(theme.accentColor)
                    .font(.system(size: 25))
                if symbol.count > 0 {
                    Image(symbol)
                }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
            ScrollView(.horizontal,showsIndicators: false) {
                HStack{
                    ForEach($restaurants,id: \.self) { $restaurant in
                        if restaurant.type == type{
                            NavigationLink {
                                DetailView(restaurant: $restaurant, theme: $theme)
                                
                            } label: {
                                ItemView(restaurant: $restaurant,theme: $theme)
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(title: "1 Star Michelin", symbol: "star",type: .oneStart, restaurants: .constant(Restaurant.allRestaurant),theme: .constant(Theme(isLightTheme: true)))
           
    }
}
