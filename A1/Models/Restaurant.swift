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
    var priceRange: String
    var schedule: [String]
    var images: [String]
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longtitude)!)
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
    
    enum Filter: String, CaseIterable, Encodable, Equatable{
        case none
        case recommend = "Recommend"
        case bib = "Bib Gourmand"
        case oneStart = "1 star"
           
    }
    
    var type: Filter{
        for type in Filter.allCases{
            if type.rawValue == distinction{
                return type
            }
        }
        return .none
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




