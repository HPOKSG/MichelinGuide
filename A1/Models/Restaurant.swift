//
//  Restaurant.swift
//  A1
//
//  Created by Hữu Phước  on 24/07/2023.
//

import Foundation
import MapKit
import CoreLocation
import SwiftUI

struct Restaurant: Codable,Hashable, Identifiable{
    var id: Int
    var name: String
    var distinction : String
    var address: String
    var introduction: String
    var quickReview: String
    var phone: String
    var websiteUrl: String
    var latitude: String
    var longtitude: String
    var isFavorite: Bool
    
    var latitudeConverter: Double?{
        if let temp = Double(latitude){
            return temp
        }
        return nil
    }
    var longtitudeConverter: Double?{
        if let temp = Double(latitude){
            return temp
        }
        return nil
    }
    var priceRange: String
    var schedule: [String]
//    var openHour: String
//    var closeHour: String
    var images: [String]
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longtitude)!)
//        if let tempLat = latitudeConverter, let tempLong = longtitudeConverter{
//            return CLLocationCoordinate2D(latitude: tempLat, longitude: tempLong)
//        }
//        return CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }
    
    var imageConverter: [Image]{
        images.map{Image($0)}
    }
    
    var icon: Image{
        if distinction == "1 star"{
            return Image( "star")
        }else if distinction == "bib gourmand"{
            return Image("bib")
        }
        return Image(systemName: "globe")
    }
    
    
    
    var openingHour: [String: String]?{
        if schedule.count == 0{
            return nil
        }
        return ["Monday": schedule[0],"Tuesday": schedule[1],"Wednesday": schedule[2],"Thursday": schedule[3],"Friday": schedule[4],"Saturday": schedule[5],"Sunday": schedule[6]]
    }
    
    static let allRestaurant: [Restaurant] = Bundle.main.decode(file: "data.json")
    static var recRestaurants: [Restaurant] {
        Restaurant.allRestaurant.filter({
            $0.distinction == "Recommend"
        })
    }
    static var bibRestaurants: [Restaurant] {
        Restaurant.allRestaurant.filter({
            $0.distinction == "Bib Gourmand"
        })
    }
    static var oneStarRestaurants: [Restaurant] {
        Restaurant.allRestaurant.filter({
            $0.distinction == "1 star"
        })
    }
}
extension Bundle{
    func decode <T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil)else{
            fatalError("Could not find \(file) in the project!")
        }
        guard let data = try? Data(contentsOf: url)else{
            fatalError("Could not load \(file) in the project!")
        }
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data)else{
            fatalError("Could not decode \(file) in the project!")
        }
        return loadedData
    }
}

func calMinutes(time: String) -> Int{
    let timeList = time.split(separator: ":")
    let hour = Int(timeList[0]) ?? 0
    let minute = Int(timeList[1]) ?? 0
    return hour * 60 + minute
}




