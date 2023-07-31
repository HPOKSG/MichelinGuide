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

import SwiftUI
import MapKit

struct MappingView: View {
    @State var deltaValue = 0.004
    @Binding var restaurant : Restaurant
    @State var region  = MKCoordinateRegion()
    var body: some View {
        VStack{
            Map(coordinateRegion: $region,
                annotationItems:[restaurant], annotationContent: { restaurant in
                MapAnnotation(coordinate: restaurant.location ){
                    Button {
                        withAnimation(.easeOut) {
                            deltaValue *= 0.7
                            setRegion(restaurant.location)

                        }
                    } label: {
                        MapPinView()
                    }
                }
            })
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
            .frame(width: 375, height: 300)
            
        }
        .onAppear{
            setRegion(restaurant.location)
        }

    }
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
           region = MKCoordinateRegion(
               center: coordinate,
               span: MKCoordinateSpan(latitudeDelta: deltaValue, longitudeDelta: deltaValue)
           )
       }
}

struct MappingView_Previews: PreviewProvider {

    
    static var previews: some View {
        MappingView(restaurant: .constant(Restaurant.allRestaurant[0]))
    }
}
