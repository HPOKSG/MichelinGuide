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

struct FilterView: View {
    //declare the variables
    @Binding var theme: Theme
    @Binding var isFavorite: Bool
    @Binding var type: Restaurant.Filter
    var body: some View {
        VStack {
            
            Text("Filter Option")
                .bold()
            
            HStack{
                
                //declare the filter favorite button
                Button {
                    withAnimation {
                        isFavorite = isFavorite == true ? false:true
                    }
                } label: {
                    HStack(){
                        Text("Your Favorite")
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color("red"))
                            .font(.system(size: 20))
                    }
                    .padding(.all)
                    .background(isFavorite == false ? theme.secondaryColor : .gray)
                    .clipShape(Capsule())
                }
                
                //declare the filter one star michelin
                Button {
                    withAnimation {
                        type = type == .oneStart ? .none : .oneStart
                    }
                } label: {
                    HStack(){
                        Text("1 Star Michelin")
                        Image("star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                    }
                    .padding(.all)
                    .background(type != .oneStart ? theme.secondaryColor : .gray)
                    .clipShape(Capsule())
                }
            }
            
            HStack{
                
                //declare the filter bib gourmand
                Button {
                    withAnimation {
                        type = type == .bib ? .none : .bib
                    }
                    
                } label: {
                    HStack(){
                        Text("Bib Gourmand")
                        Image("bib")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                    }
                    .padding(.all)
                    .background(type != .bib ? theme.secondaryColor : .gray)
                    .clipShape(Capsule())
                }
                
                //declare the the button to filter the recommend restaurant
                Button {
                    withAnimation {
                        type = type == .recommend ? .none : .recommend
                    }
                } label: {
                    VStack(){
                        Text("Recommend")
                    }
                    .padding(.all)
                    .background(type != .recommend ? theme.secondaryColor : .gray)
                    .clipShape(Capsule())
                }
            }
        }
        .foregroundColor(theme.accentColor)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(theme: .constant(Theme(isLightTheme: true)),isFavorite: .constant(false),type: .constant(.none))
    }
}
