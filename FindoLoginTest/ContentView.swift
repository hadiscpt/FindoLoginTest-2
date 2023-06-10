//
//  ContentView.swift
//  FindoLoginTest
//
//  Created by Muhammad Hadi Sucipto on 10/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            welcomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SignUpButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity)
            .padding()
            .multilineTextAlignment(.center)
            .background(Color("primaryColor"))
            .cornerRadius(/*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
    }
}

struct SignInButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color("primaryColor"))
            .frame(maxWidth: .infinity)
            .padding()
            .multilineTextAlignment(.center)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color("primaryColor"), lineWidth: 2))
    }
}

//struct Home: View {
//    @State var isshow = false
//    var body: some View {
//        NavigationView {
//            ZStack {
//                NavigationLink(destination: register(isShow: self.$isshow), label: {
//                    Text("")
//                }).hidden()
//                signInScreenView(isShow: self.$isshow)
//            }
//        }
//
//    }
//
//}

extension View {
    func placeholder<Content: View>(
            when shouldShow: Bool,
            alignment: Alignment = .leading,
            @ViewBuilder placeholder: () -> Content) -> some View {

            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
    
}

