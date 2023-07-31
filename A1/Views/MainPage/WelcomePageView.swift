//
//  WelcomePageView.swift
//  A1
//
//  Created by Hữu Phước  on 31/07/2023.
//

import SwiftUI

struct WelcomePageView: View {
    @Binding var isPresenting: Bool
    @State var authorPopup = false
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
                    Text("\"To foster a culture of travel and eating out.\"")
                        .foregroundColor(.white)
                        .padding(.top)
                        .padding(.bottom,40)
                    
                    Button {
                        withAnimation {
                            isPresenting.toggle()
                        }
                        
                    } label: {
                        Text("Start Discover")
                            .foregroundColor(Color("red"))
                            .bold()
                            .padding(.all)
                            .background(.white)
                            .clipShape(Capsule())
                            
                    }
                }
                .padding(.bottom,100)
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button{
                            withAnimation(.spring()){
                                authorPopup = true
                            }
                            
                        }label: {
                            Image(systemName: "info.circle")
                                .font(.title)
                                .padding(.trailing,20)
                                .foregroundColor(.white)
                        }
                        .disabled(authorPopup)
                    }
                }
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .opacity(authorPopup ? 0.5 :0)
                AuthorInfoView( close: $authorPopup)
                .offset(y: authorPopup ? 0: UIScreen.main.bounds.height)
            }
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView(isPresenting: .constant(true))
    }
}
