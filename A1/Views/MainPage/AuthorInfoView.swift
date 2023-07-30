//
//  AuthorInfoView.swift
//  A1
//
//  Created by Hữu Phước  on 29/07/2023.
//

import SwiftUI

struct AuthorInfoView: View {
    @Environment (\.dismiss) private var dismiss
    @Binding var close: Bool
    @State var changeColor = false
    var body: some View {
            RoundedRectangle(cornerRadius: 20)
            .frame(width: 375,height: 225)
            .overlay{
                ZStack{
                    Button {
                        close.toggle()
                    } label: {
                        VStack {
                            HStack{
                                Spacer()
                                Image(systemName: "xmark")
                                    .padding([.top,.trailing])
                                    .foregroundColor(changeColor ? .black:.white)
                            }
                            Spacer()
                        }
                    }
                    VStack(spacing: 10){
                        Text("Author Information")
                            .font(.title)
                        Divider()
                            .background(.white)
                        Text("Name: Dinh Gia Huu Phuoc")
                        Text("Student Number: s3878270")
                        Text("Major: Software Engineering")
                            .padding(.bottom)
                    }
                    .foregroundColor(.white)
                }
            }
    }
}


struct AuthorInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorInfoView(close:  .constant(false))
    }
}
