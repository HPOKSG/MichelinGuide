//
//  Location.swift
//  A1
//
//  Created by Hữu Phước  on 29/07/2023.
//

import Foundation
import MapKit
struct Location: Identifiable{
    var id : UUID =  UUID()
    var coordinate: CLLocationCoordinate2D
}
