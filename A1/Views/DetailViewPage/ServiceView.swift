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

struct ServiceView: View {
    @Binding var theme: Theme
    var body: some View {
        
        //use vstack to create the list of text info
        VStack{
            Text("Facilities & Services")
                .frame(maxWidth:.infinity,alignment: .leading)
                .font(.system(size:20))
            
            VStack(spacing: 10){
                Label("Air Condition", systemImage: "air.conditioner.horizontal")
                    .frame(maxWidth: .infinity,alignment:.leading)
                Label("Credit card / Debit card accepted", systemImage: "creditcard")
                    .frame(maxWidth: .infinity,alignment:.leading)
                Label("American Express credit card", systemImage: "creditcard")
                    .frame(maxWidth: .infinity,alignment:.leading)
                Label("Visa credit card", systemImage: "creditcard")
                    .frame(maxWidth: .infinity,alignment:.leading)
                Label("Credit card / Debit card accepted", systemImage: "creditcard")
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            .padding(.top)
            .frame(maxWidth: .infinity,alignment:.leading)
            
        }
        .foregroundColor(theme.accentColor)
        .bold()
        .lineSpacing(5)
        .padding(.all)
        .background(theme.secondaryColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.all)
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView(theme: .constant(Theme(isLightTheme: true)))
    }
}
