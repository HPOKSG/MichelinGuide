//
//  FrontPageView.swift
//  A1
//
//  Created by Hữu Phước  on 29/07/2023.
//

import SwiftUI

struct FrontPageView: View {
    var body: some View {
        ZStack{
            Color("red")
                .edgesIgnoringSafeArea(.all)
        
            VStack(spacing: 0){
                Image("star-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80)
                Text("GUIDE")
                    .bold()
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text("MICHELIN")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 60))
                    
            }
        }
    }
}

struct FrontPageView_Previews: PreviewProvider {
    static var previews: some View {
        FrontPageView()
    }
}
