//
//  SignUpPage.swift
//  FindoLoginTest
//
//  Created by Muhammad Hadi Sucipto on 10/06/23.
//
import AuthenticationServices
import SwiftUI

struct SignUpView: View {
    @State private var isModalPresented = false
    
    @Environment(\.colorScheme) var colorScheme

    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    var body: some View {
        ZStack {
            Color ("secondaryColor").edgesIgnoringSafeArea(.all)
            VStack {
                Image ("FindoLogo")
                    .resizable(capInsets: EdgeInsets())
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                    .imageScale(.small)

                ScrollView(.vertical, showsIndicators: true) {
                    VStack (alignment:.leading, spacing: 0) {
                        
                        Text ("Selamat datang di Findo, aplikasi yang akan membantu mu menemukan orang Indonesia saat kamu sedang di luar negeri. Kamu bisa mengikuti guideline ini untuk kenyamanan sesama pengguna:")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .padding(.all, 20.0)
                        
                        Text ("Berkomunikasi Dengan Baik")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 20.0)
                        
                        Text ("Berkomunikasilah dengan lawan bicara mu dengan ramah, sopan dan santun. Jaga sikap terbuka dan hormati pendapat serta perasaan orang lain.")
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 20.0)
                        
                        Text ("Hormati Sesama Pengguna")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 20.0)
                        
                        Text ("Hormati privasi sesama pengguna dan jangan membagikan informasi pribadi mereka tanpa izin. Jaga kerahasiaan percakapan atau rincian pribadi yang mungkin Anda ketahui.")
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 20.0)
                        
                        Text ("Let’s Hangout! Tapi…")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 20.0)
                        
                        Text ("Tetap jaga keamanan dengan masing-masing pengguna. Bila ada pengguna yang menganggu mu, kamu selalu bisa menggunakan tombol report dan block dari fitur WhatsApp.")
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 20.0)
                        
                        
                    }
                    
                }
                
                VStack{
                    NavigationLink(
                        destination: SetPhotoProfile().navigationBarHidden(true),
                        label: {
                            SignInWithAppleButton(.continue) {
                                request in
                                
                                request.requestedScopes = [.email, .fullName]
                                
                            } onCompletion: { result in
                                
                                switch result {
                                case .success(let auth):
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
                            
//                            SignInButtonView()
//                                .padding()
                        })
                }
                
                
                
//                SignInWithAppleButton(.continue) {
//                    request in
//
//                    request.requestedScopes = [.email, .fullName]
//
//                } onCompletion: { result in
//
//                    switch result {
//                    case .success(let auth):
//                        switch auth.credential {
//                        case let credential as ASAuthorizationAppleIDCredential:
//                            //user id
//                            let userId = credential.user
//
//                            let email = credential.email
//                            let firstName = credential.fullName?.givenName
//                            let lastName = credential.fullName?.familyName
//
//                            self.email = email ?? ""
//                            self.userId = userId
//                            self.firstName = firstName ?? ""
//                            self.lastName = lastName ?? ""
//
//                        default:
//                            break
//                        }
//
//
//
//                    case .failure(let error):
//                        print(error)
//                    }
//
//                }
                .signInWithAppleButtonStyle(
                    colorScheme == .dark ? .white : .black
                    )
                .cornerRadius(50)
                .frame(height: 54)
                .padding()
                
                Divider()

                

            }
            
            
        }
    }
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
