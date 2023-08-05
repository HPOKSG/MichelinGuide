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

struct ListView: View {
    
    //declare all the required variable
    @State var restaurantName: String = ""
    @State var isFavorite:Bool = false
    @State var type:Restaurant.Filter = .none
    @Binding var restaurants: [Restaurant]
    @Binding var theme: Theme
    
    var body: some View {
        ZStack{
            
            //add the background theme color
            theme.primaryColor
                .edgesIgnoringSafeArea(.all)
            
            //delcare the main body of the view
            ScrollView {
                
                LazyVStack (spacing: 20) {
                    
                    //add the search bar
                    TextField("", text: $restaurantName,prompt: Text("Name of the restaurant...").foregroundColor(theme.accentColor))
                        .textFieldStyle(TextFieldStyleView(theme:theme, systemImageString: "magnifyingglass"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                    
                    //add the set of filter options
                    FilterView(theme: $theme, isFavorite: $isFavorite, type: $type)
                    
                    //display the list of restaurants based on the filter view.
                    ForEach($restaurants,id: \.id) { $restaurant in
                        
                        //check if the user enter nothing
                        if (restaurantName.isEmpty){
                            
                            //check if the user want to select their favorite restaurant only
                            if isFavorite{
                                
                                //check if the user specify their specify the restaurant's category.
                                if type != .none{
                                    if (restaurant.isFavorite) && restaurant.type == type{
                                        NavigationItemView(restaurant: $restaurant, theme: $theme)
                                    }
                                    
                                }else{
                                    if (restaurant.isFavorite){
                                        NavigationItemView(restaurant: $restaurant, theme: $theme)
                                    }
                                }
                            }else{
                                if type != .none{
                                    if restaurant.type == type{
                                        NavigationItemView(restaurant: $restaurant, theme: $theme)
                                    }
                                    
                                }else{
                                    NavigationItemView(restaurant: $restaurant, theme: $theme)
                                }
                            }
                        }else{
                            if isFavorite{
                                if type != .none{
                                    if restaurant.name.contains(restaurantName) && (restaurant.isFavorite) && restaurant.type == type{
                                        NavigationItemView(restaurant: $restaurant, theme: $theme)
                                    }
                                }else{
                                    if restaurant.name.contains(restaurantName) &&  (restaurant.isFavorite){
                                        NavigationItemView(restaurant: $restaurant, theme: $theme)
                                    }
                                }
                            }else{
                                if type != .none{
                                    if restaurant.name.contains(restaurantName) && restaurant.type == type{
                                        NavigationItemView(restaurant: $restaurant, theme: $theme)
                                    }
                                }else{
                                    if restaurant.name.contains(restaurantName){
                                        NavigationItemView(restaurant: $restaurant, theme: $theme)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .onDisappear{
            //reset the filter selection
            type = .none
            isFavorite = false
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(restaurants:.constant(Restaurant.allRestaurant), theme: .constant(Theme(isLightTheme: false)))
    }
}



