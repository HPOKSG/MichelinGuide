//
//  ContactInformation.swift
//  A1
//
//  Created by Hữu Phước  on 27/07/2023.
//

import SwiftUI

struct ContactInformation: View {
    @Binding var restaurant: Restaurant
    @Binding var theme: Theme
    var body: some View {
        VStack(spacing: 20){
            Text("Contact Information")
                .frame(maxWidth:.infinity,alignment: .leading)
                .font(.system(size:20))
            Button {
                callNumber(phoneNumber: restaurant.phone)
            } label: {
                Label(restaurant.phone, systemImage: "phone")
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            Link(destination: URL(string:restaurant.websiteUrl)!) {
                Label(restaurant.websiteUrl, systemImage: "globe")
                .frame(maxWidth: .infinity,alignment:.leading)
            }
            
        }
        .bold()
        .foregroundColor(.black)
        .lineSpacing(5)
        .padding(.all)
        .background(theme.secondaryColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.all)
    }
}

struct ContactInformation_Previews: PreviewProvider {
    static var previews: some View {
        ContactInformation(restaurant: .constant(Restaurant.allRestaurant[0]),theme: .constant(Theme(isLightTheme: true)))
    }
}

private func callNumber(phoneNumber:String) {
  if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
    let application:UIApplication = UIApplication.shared
    if (application.canOpenURL(phoneCallURL)) {
        application.open(phoneCallURL, options: [:], completionHandler: nil)
    }
  }
}
