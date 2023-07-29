//
//  LocationViewModel.swift
//  A1
//
//  Created by Hữu Phước  on 28/07/2023.
//

import UIKit
import MapKit

@MainActor
class LocationViewModel: ObservableObject,Identifiable{
    
    
    @Published var mapRegion: MKCoordinateRegion
    @Published var latitudeDelta = 0.1
    @Published var longitudeDelta = 0.1
    
    var location: [Location]
    
    init() {
        mapRegion = MKCoordinateRegion(center:  Restaurant.allRestaurant[0].location, span:  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        let temp = Location(coordinate: Restaurant.allRestaurant[0].location)
        location =  [temp]
    }
    
    func zoomIn(){
        latitudeDelta *= 0.5
        longitudeDelta *= 0.5
        mapRegion = MKCoordinateRegion(center:  Restaurant.allRestaurant[0].location, span: MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta))
    }
    
    func updateMapRegion(newRegion: CLLocationCoordinate2D){
        mapRegion = MKCoordinateRegion(center: Restaurant.allRestaurant[0].location , span:  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        updateLocation(Location(coordinate: newRegion))
    }
    
    func updateLocation(_ newLocation: Location){
        location = [newLocation]
    }
}
