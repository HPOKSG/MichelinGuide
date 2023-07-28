//
//  LocationViewModel.swift
//  A1
//
//  Created by Hữu Phước  on 28/07/2023.
//

import UIKit
import MapKit

@MainActor
class LocationViewModel: ObservableObject{
    
    @Published var mapRegion: MKCoordinateRegion
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let region = MKCoordinateRegion(center: Restaurant.allRestaurant[0].location, span: span)
        mapRegion = region
    }
    
    func updateMapRegion(newRegion: CLLocationCoordinate2D){
        mapRegion = MKCoordinateRegion(center: newRegion, span: span)
    }
}
