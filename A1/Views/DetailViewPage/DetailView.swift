//
//  DetailView.swift
//  A1
//
//  Created by Hữu Phước  on 24/07/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
    @EnvironmentObject var vm: LocationViewModel
    var body: some View {
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    ImageSliderView(restaurant: $restaurant, theme: $theme)
                    VStack{
                     
                            HStack{
                                Text(restaurant.name.uppercased()) // display restaurant name
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(theme.accentColor)
                                restaurant.icon
                            }
                            .frame(width:375,alignment: .leading)
                        .padding(.leading)
                        
                        
                        POVView(restaurant: $restaurant, theme: $theme)
                        ServiceView(theme: $theme)
                        if let _ = restaurant.openingHour{
                            OpeningHours(restaurant: $restaurant, theme: $theme)
                        }
                        ContactInformation(restaurant: $restaurant, theme: $theme)
                        MappingView()
        
                    }
                }
            }
        }
        .onAppear{
            vm.updateMapRegion(newRegion: restaurant.location)
        }
       
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(restaurant: .constant(Restaurant.allRestaurant[0])
                   ,theme: .constant(Theme(isLightTheme: true)))
        .environmentObject(LocationViewModel())
        
    }
}
