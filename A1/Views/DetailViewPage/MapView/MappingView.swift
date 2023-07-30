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
    @EnvironmentObject var vm : LocationViewModel
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $vm.mapRegion,
                annotationItems: vm.location, annotationContent: { location in
                MapAnnotation(coordinate: location.coordinate ){
                    Button {
                        withAnimation(.easeOut) {
                            vm.zoomIn()
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
  
        
       
    }
}

struct MappingView_Previews: PreviewProvider {

    
    static var previews: some View {
        MappingView()
            .environmentObject(LocationViewModel())
            
    }
}
