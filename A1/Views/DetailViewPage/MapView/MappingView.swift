//
//  MappingView.swift
//  A1
//
//  Created by Hữu Phước  on 27/07/2023.
//

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
