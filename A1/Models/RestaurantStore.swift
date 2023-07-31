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

@MainActor
class RestaurantStore: ObservableObject{
    @Published var restaurants: [Restaurant] = []
    
    static var FILEURL = "data.json"
    
    private static func fileURL() throws ->URL{
        guard let url = Bundle.main.url(forResource: FILEURL, withExtension: nil)else{
            fatalError("Could not find \(FILEURL) in the project!")
        }
        return url
    }
//    func load() async throws{
//        let task = Task <[Restaurant],Error>{
//            let fileURL = try Self.fileURL()
//            guard let data = try? Data(contentsOf: fileURL)else{
//                return []
//            }
//            let dailyScrums = try JSONDecoder().decode([Restaurant].self, from: data)
//            return dailyScrums
//        }
//        let restaurants = try await task.value
//        self.restaurants = restaurants
//    }
    func load(){
        if let file = Bundle.main.url(forResource: RestaurantStore.FILEURL, withExtension: nil){
            if let data = try? Data(contentsOf: file) {
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode([Restaurant].self, from: data)
                    self.restaurants = decoded
                } catch let error {
                    fatalError("Failed to decode JSON: \(error)")
                }
            }
        } else {
            fatalError("Couldn't load \(RestaurantStore.FILEURL) file")
        }
    
    }

    
    
//    func save(restaurants: [Restaurant]) async throws{
//        let task = Task{
//            let data = try JSONEncoder().encode(restaurants)
//            let outfile = try Self.fileURL()
//            try data.write(to: outfile)
//        }
//        _ = try await task.value
//    }
    
}
