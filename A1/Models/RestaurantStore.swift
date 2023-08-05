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
    
    //declare the static file name of the data
    static var FILEURL = "data.json"
    
    //load function for use to read file data json
    //and converrt to the restaurant object
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
}
