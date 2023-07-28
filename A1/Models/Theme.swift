//
//  Color.swift
//  A1
//
//  Created by Hữu Phước  on 25/07/2023.
//

import SwiftUI

//enum Theme: String, CaseIterable, Identifiable,Codable {
//    case bubblegum
//    case buttercup
//    case indigo
//    case lavender
//    case magenta
//    case navy
//    case orange
//    case oxblood
//    case periwinkle
//    case poppy
//    case purple
//    case seafoam
//    case sky
//    case tan
//    case teal
//    case yellow
//    case background
//
//    var accentColor: Color {
//        switch self {
//        case .bubblegum,.background, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
//        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
//        }
//    }
//    var mainColor: Color {
//        Color(rawValue)
//    }
//    var name: String {
//        rawValue.capitalized
//    }
//    var id: String {
//        name
//    }
//}

struct Theme {
    var isLightTheme: Bool
    var accentColor: Color {
        return isLightTheme ? Color.black : Color.white;
    }
    var mainColor: Color{
        return isLightTheme ? Color("background") :Color.black
    }
}
