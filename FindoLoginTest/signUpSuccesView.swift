//
//  signUpSuccesView.swift
//  FindoLoginTest
//
//  Created by Muhammad Hadi Sucipto on 11/06/23.
//

import SwiftUI

struct signUpSuccesView: View {
    var background: Color = Color("Yellow")
    var body: some View {
        ZStack{
            Color ("secondaryColor").edgesIgnoringSafeArea(.all)
            VStack{
                Image("icon")
                    .resizable()
                
                    .aspectRatio(contentMode: .fit)
                    .padding(.all, 80.0)
                
                
                Text("Selesai!")
                    .font(.title3)
                    .foregroundColor(Color.white)
                
                    .multilineTextAlignment(.leading)
                Text("Saatnya bertemu sesama")
                    .font(.title3)
                    .foregroundColor(Color.white)
                
                    .multilineTextAlignment(.leading)
                Text("orang Indonesia")
                    .font(.title3)
                    .foregroundColor(Color.white)
                
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 140.0)
                
                NavigationLink(destination: MainProfile(), label: {
                    Text("Lanjutkan")
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .frame(width: 150, height: 60)
                        .clipShape(Capsule())
                        .background(background).cornerRadius(30)
//                        .padding(.top, 250.0)
                        .padding(.horizontal)
                } )
            }
            
        }
    }
}

struct signUpSuccesView_Previews: PreviewProvider {
    static var previews: some View {
        signUpSuccesView()
    }
}
