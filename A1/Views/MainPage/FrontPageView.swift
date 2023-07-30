//
//  FrontPageView.swift
//  A1
//
//  Created by Hữu Phước  on 29/07/2023.
//

import SwiftUI

struct FrontPageView: View {
    @Environment (\.scenePhase) private var scenePhase
    @State var isPresenting = false
    @Binding var restaurants:[Restaurant]
    let saveAction: ()->Void
    var body: some View {
        NavigationStack{
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
                    
                    NavigationLink {
                        MainView(restaurants: $restaurants)
                    } label: {
                        Text("Start Discover")
                            .foregroundColor(Color("red"))
                            .bold()
                            .padding(.all)
                            .background(.white)
                            .clipShape(Capsule())
                            .offset(y:40)
                    }
                }
                .padding(.bottom,100)
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button{
                            withAnimation(.spring()){
                                isPresenting = true
                            }
                            
                        }label: {
                            Image(systemName: "info.circle")
                                .font(.title)
                                .padding(.trailing,20)
                                .foregroundColor(.white)
                        }
                        .disabled(isPresenting)
                    }
                }
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .opacity(isPresenting ? 0.5 :0)
                AuthorInfoView( close: $isPresenting)
                .offset(y: isPresenting ? 0: UIScreen.main.bounds.height)
            }
        }
        .onAppear{
            print(restaurants)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive{saveAction()}
            print("inactive")
        }
    }
}

struct FrontPageView_Previews: PreviewProvider {
    static var previews: some View {
        FrontPageView(restaurants: .constant(Restaurant.allRestaurant), saveAction: {})
            .environmentObject(LocationViewModel())
    }
}
