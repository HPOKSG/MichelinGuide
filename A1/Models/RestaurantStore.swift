//
//  RestaurantStore.swift
//  A1
//
//  Created by Hữu Phước  on 29/07/2023.
//

import Foundation

@MainActor
class RestaurantStore: ObservableObject{
    @Published var restaurants: [Restaurant] = []
    
    static var FILEURL = "data.json"
    
    private static func fileURL() throws ->URL{
//        try FileManager.default.url(for:.documentDirectory, in: .userDomainMask,appropriateFor: nil,create: false)
//            .appendingPathComponent("restaurants.data")
        guard let url = Bundle.main.url(forResource: FILEURL, withExtension: nil)else{
            fatalError("Could not find \(FILEURL) in the project!")
        }
        return url
    }
    func load() async throws{
        let task = Task <[Restaurant],Error>{
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL)else{
                return []
            }
            let dailyScrums = try JSONDecoder().decode([Restaurant].self, from: data)
            return dailyScrums
        }
        let restaurants = try await task.value
        self.restaurants = restaurants
    }
    func save(restaurants: [Restaurant]) async throws{
        print ("save")
        print(restaurants)
        let task = Task{
            let data = try JSONEncoder().encode(restaurants)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
    
}
