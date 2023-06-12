//
//  SetPhotoProfile.swift
//  FindoLoginTest
//
//  Created by Muhammad Hadi Sucipto on 12/06/23.
//

import PhotosUI
import SwiftUI

struct SetPhotoProfile: View {
    @State var changeProfile = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    var background: Color = Color("Yellow")
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    Text("Atur Foto Profil")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                        .position(x: 185, y: 50)
                    
                    ZStack{
                        Button(action: {
                            changeProfile = true
                            openCameraRoll = true
                        }, label: {
                            if changeProfile{
                                Image(uiImage: imageSelected)
                                    .resizable()
                                    .frame(width: 250, height: 250)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .foregroundColor(.gray)
                                    .frame(width: 250, height: 250)
                                    .clipShape(Circle())
                                    .position(x: 190, y: -80)
                            }
                            
                            
                        })
                        
//                        Image(systemName: "square.and.pencil")
//                            .frame(width: 30, height: 30)
//                            .foregroundColor(.black)
//                            .background(Color.gray)
//                            .clipShape(Circle())
//                            .position(x: 240, y:100)
                        
                    } .sheet(isPresented: $openCameraRoll) {
                        ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
                    }
                    
                    NavigationLink(destination: SetProfile(), label: {
                        Text("Konfirmasi")
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                            .frame(width: 330, height: 60)
                            .clipShape(Capsule())
                            .background(background).cornerRadius(30)
                            .padding(.bottom, 30.0)
                            .padding(.horizontal)
                    } )
                }
            }
        }
    }
    
    
    struct SetPhotoProfile_Previews: PreviewProvider {
        static var previews: some View {
            SetPhotoProfile()
        }
    }
}

