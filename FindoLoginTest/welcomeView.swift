//
//  welcomeView.swift
//  FindoLoginTest
//
//  Created by Muhammad Hadi Sucipto on 10/06/23.
//

import AuthenticationServices
import SwiftUI

struct welcomeView: View {
    @State private var isModalPresented = false
    
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
                    welcomeImageView()
                    taglineTextView()
                    Text("Temukan sesama pelajar Indonesia terdekat, bina persahabatan, dan kembangkan minat bersama!")
                        .font(.title3)
                        .foregroundColor(Color.white)
                    
                        .multilineTextAlignment(.leading)
                        .padding(.all, 30.0)
                    VStack{
                        NavigationLink(
                            destination: SetPhotoProfile().navigationBarHidden(true),
                            label: {
                                SignInButtonView()
                                    .padding()
                            })
                    }
                    Divider()
                    ZStack{
                        Text ("Dengan melanjutkan anda setuju dengan ")
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 30.0)
                                .alignmentGuide(.top) { dimensions in
                                                    // Adjust the vertical position of the text
                                    dimensions[VerticalAlignment.top] - 50
                                                }
                                .alignmentGuide(.trailing) { dimensions in
                                                    // Adjust the horizontal position of the text
                                    dimensions[HorizontalAlignment.trailing] - 200
                                                }
                        
                        Button(action: {
                                    isModalPresented = true
                                }) {
                                    Text("ketentuan layanan")
                                        .foregroundColor(.white)
                                        .underline()
                                        .font(.subheadline)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.white)
                                        .offset(x: -80, y: -14)
                                        .padding(.top, 40.0)
    // Adds underline to the text
                                }
                                .sheet(isPresented: $isModalPresented) {
                                    ModalView() // Presents the modal view
                                }
                        Text (" aplikasi ini")
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.white)
                                .offset(x: 20, y: 6)
                                .padding(.horizontal, 20.0)
                        

    //                    perjanjian layanan aplikasi ini
                    

                    }
                    
                    
                    
                    
                    
                    
                }
                
            }
        }
    }
    //}
    
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
                    GeometryReader {
                        let size = $0.size
                        let safeArea = $0.safeAreaInsets
                        NavigationLink(
                            destination: Scroll(size: size, safeArea: safeArea),
                            isActive: $signedIn,
                            label: {
                                EmptyView()
                            }
                        )
                        .hidden()
                        
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
    
    struct welcomeImageView: View {
        var body: some View {
            Group {
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
                
            }
            
        }
    }
    
    struct taglineTextView: View {
        var body: some View {
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
        }
    }
    
}

struct ModalView: View {
    var body: some View {
        // Your modal view content here
        ZStack {
//            Color ("secondaryColor").edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack (alignment:.leading, spacing: 0) {
                        
                        Text ("Selamat datang di Findo, aplikasi yang akan membantu mu menemukan orang Indonesia saat kamu sedang di luar negeri. Kamu bisa mengikuti guideline ini untuk kenyamanan sesama pengguna:")
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                            .padding(.all, 20.0)
                        
                        Text ("Berkomunikasi Dengan Baik")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .padding(.horizontal, 20.0)
                        
                        Text ("Berkomunikasilah dengan lawan bicara mu dengan ramah, sopan dan santun. Jaga sikap terbuka dan hormati pendapat serta perasaan orang lain.")
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.black)
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 20.0)
                        
                        Text ("Hormati Sesama Pengguna")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 20.0)
                        
                        Text ("Hormati privasi sesama pengguna dan jangan membagikan informasi pribadi mereka tanpa izin. Jaga kerahasiaan percakapan atau rincian pribadi yang mungkin Anda ketahui.")
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.black)
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 20.0)
                        
                        Text ("Let’s Hangout! Tapi…")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 20.0)
                        
                        Text ("Tetap jaga keamanan dengan masing-masing pengguna. Bila ada pengguna yang menganggu mu, kamu selalu bisa menggunakan tombol report dan block dari fitur WhatsApp.")
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.black)
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 20.0)
                        
                        
                    }
                }
                    
                }
        }
    }

    struct UnderlineTextButton: ViewModifier {
        
        @State private var showModal = false
        
        func body(content: Content) -> some View {
            Button(action: {
                showModal = true
            }) {
                content
                    .foregroundColor(.blue)
                    .padding(.vertical, 8)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.blue)
                            .offset(y: 5)
                    )
            }
        }
        
    }
}
