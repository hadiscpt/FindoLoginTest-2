//
//  ChangeProfileView.swift
//  FindoLoginTest
//
//  Created by Muhammad Hadi Sucipto on 12/06/23.
//

import PhotosUI
import SwiftUI

struct ChangeProfileView: View {
    @State var changeProfile = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    @State private var name: String = ""
    @State private var universitas: String = ""
    @State private var bio: String = ""
    
    @Binding var isShowing: Bool
    @State private var showModal = false
    
    var background: Color = Color("Yellow")
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing){
                VStack {
                    Text("Pengaturan Profil")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    
                    ZStack{
                        Button(action: {
                            changeProfile = true
                            openCameraRoll = true
                        }, label: {
                            if changeProfile{
                                Image(uiImage: imageSelected)
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                            }
                            
                            
                        })
                        
                        Image(systemName: "square.and.pencil")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .background(Color.gray)
                            .clipShape(Circle())
                            .position(x: 240, y:100)
                        
                    } .sheet(isPresented: $openCameraRoll) {
                        ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
                    }
                    
                    
                    Group{
                        Text("Nama: ")
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 305.0)
                        
                        TextField("", text: $name)
                            .padding(.horizontal, 20.0)
                            .multilineTextAlignment(.leading)
                        
                            .onChange(of: name) { newValue in
                                if newValue.count > 240 {
                                    name = String(newValue.prefix(240))
                                }
                            }
                        
                        Text("\(name.count)/50characters")
                            .foregroundColor(name.count > 50 ? .red : .gray)
                            .font(.footnote)
                            .padding(.top, 2)
                            .hidden()
                    }
                    
                    Divider()
                    Group {
                        Text("Univeritas: ")
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 272.0)
                        TextField("", text: $universitas)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 20.0)
                            .onChange(of: universitas) { newValue in
                                if newValue.count > 240 {
                                    universitas = String(newValue.prefix(240))
                                }
                            }
                        Text("\(universitas.count)/50characters")
                            .foregroundColor(universitas.count > 50 ? .red : .gray)
                            .font(.footnote)
                            .padding(.top, 2)
                            .hidden()
                    }
                    Divider()
                    Group {
                        Text("Bio: ")
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 320.0)
                        TextEditor(text: $bio)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 20.0)
                            .onChange(of: bio) { newValue in
                                if newValue.count > 240 {
                                    bio = String(newValue.prefix(240))
                                }
                            }
                        Text("\(bio.count)/140characters")
                            .foregroundColor(bio.count > 140 ? .red :.gray)
                            .font(.footnote)
                            .padding(.top, 2)
                        
                        
                    }
                    
                    Divider()
                    
                    NavigationLink(destination: MainProfile(), label: {
                        Text("Konfirmasi")
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                            .frame(width: 150, height: 60)
                            .clipShape(Capsule())
                            .background(background).cornerRadius(30)
                            .padding(.top, 250.0)
                            .padding(.horizontal)
                    } )
                }
            }
        }
    }
    
    struct ChangeProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ChangeProfileView(isShowing: .constant(true))
        }
    }
}
