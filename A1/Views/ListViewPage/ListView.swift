
import SwiftUI

struct ListView: View {
    @State var restaurantName: String = ""
    @State var isFavorite:Bool = false
    @State var type:Restaurant.Filter = .none
    @Binding var restaurants: [Restaurant]
    @Binding var theme: Theme
    var body: some View {
        ZStack{
            theme.primaryColor
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVStack (spacing: 20) {
                    TextField("", text: $restaurantName,prompt: Text("Name of the restaurant...").foregroundColor(.white))
                        .textFieldStyle(TextFieldStyleView(theme:theme, systemImageString: "magnifyingglass"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                    FilterView(theme: $theme, isFavorite: $isFavorite, type: $type)
                    ForEach($restaurants,id: \.id) { $restaurant in
                        if (restaurantName.isEmpty){
                            if isFavorite{
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
                                NavigationItemView(restaurant: $restaurant, theme: $theme)
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
            type = .none
            isFavorite = false
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(restaurants:.constant(Restaurant.allRestaurant), theme: .constant(Theme(isLightTheme: false)))
            .environmentObject(LocationViewModel())
    }
}



