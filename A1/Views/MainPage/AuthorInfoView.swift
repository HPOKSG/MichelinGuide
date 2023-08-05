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

struct AuthorInfoView: View {
    
    //delcare the variables
    @Binding var close: Bool
    @State var changeColor = false
    
    var body: some View {
        
        //create the background view
        RoundedRectangle(cornerRadius: 20)
            .fill(Color("black"))
            .frame(width: 375,height: 200)
            .overlay{
                //main body info
                ZStack{
                    VStack {
                        //this button is used to close the view
                        Button {
                            close.toggle()
                        } label: {
                            //format the closed button
                            HStack{
                                Spacer()
                                Image(systemName: "xmark")
                                    .padding([.top,.trailing])
                                    .foregroundColor(changeColor ? .black:.white)
                            }
                            Spacer()
                        }
                        
                        //display the author information
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
}


struct AuthorInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorInfoView(close:  .constant(false))
    }
}
