//
//  SetProfile.swift
//  FindoLoginTest
//
//  Created by Muhammad Hadi Sucipto on 12/06/23.
//

import SwiftUI

struct SetProfile: View {
    @State private var name: String = ""
    @State private var universitas: String = ""
    @State private var bio: String = ""
    var background: Color = Color("Yellow")
    var body: some View {
        NavigationView{
            VStack {
                Text("Atur Profil")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
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
                
                NavigationLink(destination: hobbyView().navigationBarHidden(true), label: {
                    Text("Lanjutkan")
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .frame(width: 330, height: 60)
                        .clipShape(Capsule())
                        .background(background).cornerRadius(30)
                        .padding(.bottom, 30.0)
                        .padding(.top, 100)
                        .padding(.horizontal)
                } )
            }
            
        }
        
    }
    
    struct SetProfile_Previews: PreviewProvider {
        static var previews: some View {
            SetProfile()
        }
    }
}
