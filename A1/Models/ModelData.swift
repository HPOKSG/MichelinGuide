//
//  ModelData.swift
//  A1
//
//  Created by Hữu Phước  on 25/07/2023.
//

import Foundation

struct ModelData{
    static let allRestaurant: [Restaurant] = Bundle.main.decode(file: "data.json")
    
    
}
