//
//  MapPinView.swift
//  A1
//
//  Created by Hữu Phước  on 29/07/2023.
//

import SwiftUI

struct MapPinView: View {
    var body: some View {
        VStack{
            Image(systemName: "map.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                .foregroundColor(.red)
            Image(systemName: "triangle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 10)
                .foregroundColor(.red)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-10)
//                .padding(.bottom, 50)
        }
    }
}

struct MapPinView_Previews: PreviewProvider {
    static var previews: some View {
        MapPinView()
    }
}
