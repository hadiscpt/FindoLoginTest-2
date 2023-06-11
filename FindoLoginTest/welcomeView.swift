//
//  welcomeView.swift
//  FindoLoginTest
//
//  Created by Muhammad Hadi Sucipto on 10/06/23.
//

import AuthenticationServices
import SwiftUI

struct welcomeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    private var isSignedIn: Bool {
        !userId.isEmpty
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color ("secondaryColor").edgesIgnoringSafeArea(.all)
                VStack {
                    Image ("FindoLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100.0, height: 100.0)
                        .imageScale(.small)
                    
                    Image ("onboard")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 225.0, height: 215.0)
                        .imageScale(.small)
                        .foregroundColor(.accentColor)
                    Group {
                            Text("Temukan ")
                            .font(.title2)
                            .fontWeight(.semibold)
                                .foregroundColor(Color.orange) +
                            Text("orang ")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white) +
                            Text("Indonesia")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.orange)
                        }
                    Text("Temukan sesama pelajar Indonesia terdekat, bina persahabatan, dan kembangkan minat bersama!")
                        .font(.title3)
                        .foregroundColor(Color.white)
                    
                        .multilineTextAlignment(.leading)
                        .padding(.all, 30.0)
                    
                    VStack{
                        NavigationLink(
                            destination: SignUpView().navigationBarHidden(true),
                            label: {
                                SignUpButton (title: "Sign Up")
                                    .padding()
                            })
                    }
                    
                    if userId.isEmpty {
                        SignInButtonView()
                        
                    }
                        
                    
                    
                }
                
            }
        }
    }
}

struct welcomeView_Previews: PreviewProvider {
    static var previews: some View {
        welcomeView()
    }
}

struct SignInButtonView: View {
    @State private var signedIn = false
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    var body: some View {
        SignInWithAppleButton(.continue) {
            request in
            
            request.requestedScopes = [.email, .fullName]
            
        } onCompletion: { result in
            
            switch result {
            case .success(let auth):
                // handle successfull authorization
                signedIn = true
                switch auth.credential {
                case let credential as ASAuthorizationAppleIDCredential:
                    //user id
                    let userId = credential.user
                    
                    let email = credential.email
                    let firstName = credential.fullName?.givenName
                    let lastName = credential.fullName?.familyName
                    
                    self.email = email ?? ""
                    self.userId = userId
                    self.firstName = firstName ?? ""
                    self.lastName = lastName ?? ""
                    
                default:
                    break
                }
                
                
                
            case .failure(let error):
                print(error)
            }
            
        }
        .signInWithAppleButtonStyle(
            colorScheme == .dark ? .white : .black
            )
        .cornerRadius(50)
        .frame(height: 54)
        .padding()
        
    }
}


