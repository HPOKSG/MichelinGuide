//
//  RestaurantViewModel.swift
//  A1
//
//  Created by Hien Vo Tran Minh on 28/07/2023.
//

import Foundation

class RestaurantViewModel: ObservableObject{
    @Published var restaurants: [Restaurant] = Restaurant.allRestaurant
    
    enum Filter{
        case recommend
        case bib
        case oneStar
    }
    
    @Published var filter: Filter = .recommend
    
    
    var filterRestaurant: [Restaurant]{
        switch filter{
        case .recommend:
            return restaurants.filter{$0.distinction == "recommend"}
        case .bib:
            return restaurants.filter{$0.distinction == "Bib Gourmand"}
        case .oneStar:
            return restaurants.filter{$0.distinction == "1 star"}
        }
    }
    
    func filter(_ type: Filter)->[Restaurant]{
        filterRestaurant
    }
    
//    @Published var oneStartRestaurant
}
    
