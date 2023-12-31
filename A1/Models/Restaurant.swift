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
import Foundation
import MapKit
import CoreLocation
import SwiftUI

struct Restaurant: Codable,Hashable, Identifiable{
    //declare variables
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
    
    //declare enum to identify the cateogry of the restaurant
    enum Filter: String, CaseIterable, Encodable, Equatable{
        case none
        case recommend = "Recommend"
        case bib = "Bib Gourmand"
        case oneStart = "1 star"
        
    }
    
    
    //convert to the location from lat and long
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longtitude)!)
    }
    
    var imageConverter: [Image]{
        images.map{Image($0)}
    }
    
    // set the proper icon image according to the category of the restaurant
    var icon: Image?{
        if distinction == "1 star"{
            return Image( "star")
        }else if distinction == "Bib Gourmand"{
            return Image("bib")
        }
        return nil
    }
    
    var openingHour: [String: String]?{
        if schedule.count == 0{
            return nil
        }
        return ["Monday": schedule[0],"Tuesday": schedule[1],"Wednesday": schedule[2],"Thursday": schedule[3],"Friday": schedule[4],"Saturday": schedule[5],"Sunday": schedule[6]]
    }
    
    static let allRestaurant: [Restaurant] = Bundle.main.decode(file: "data.json")
    
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




