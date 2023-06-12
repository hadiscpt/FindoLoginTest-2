//
//  FilterView.swift
//  FindoLoginTest
//
//  Created by Muhammad Hadi Sucipto on 12/06/23.
//

import SwiftUI

struct FilterView: View {
    @Binding var isShowing: Bool
    var body: some View {
        
        ZStack(alignment: .bottom){
            if isShowing {
                Color.white
                    .opacity(0.8)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                ScrollView(.horizontal) {
                    HStack{
                            Button(action: {
                                
                            }, label: {
                                Text("Anime")
                                    .padding()
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .frame(width: 85, height: 35)
                                    .clipShape(Capsule())
                                    .background(RoundedRectangle(cornerRadius: 20, style: .continuous) .stroke())
                            })
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Tidur")
                                    .padding()
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .frame(width: 85, height: 35)
                                    .clipShape(Capsule())
                                    .background(RoundedRectangle(cornerRadius: 20, style: .continuous) .stroke())
                            })
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Bola")
                                    .padding()
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .frame(width: 85, height: 35)
                                    .clipShape(Capsule())
                                    .background(RoundedRectangle(cornerRadius: 20, style: .continuous) .stroke())
                            })
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Makan")
                                    .padding()
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .frame(width: 85, height: 35)
                                    .clipShape(Capsule())
                                    .background(RoundedRectangle(cornerRadius: 20, style: .continuous) .stroke())
                            })
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Pacaran")
                                .padding()
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .frame(width: 85, height: 35)
                                .clipShape(Capsule())
                                .background(RoundedRectangle(cornerRadius: 20, style: .continuous) .stroke())
                        })
                            
                        }

                }
                                .frame(height: 100)
                .frame(maxWidth: 400)
//                .background(Color.white)
                .transition(.move(edge: .bottom))
                .cornerRadius(0)
            }
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut)
            
        }
    }
    
    struct FilterView_Previews: PreviewProvider {
        static var previews: some View {
            MainTabView()
//            FilterView(isShowing: .constant(true))
        }
    }


