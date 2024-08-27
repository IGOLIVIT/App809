//
//  AddPlace.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI

struct AddPlace: View {

    @StateObject var viewModel: PlacesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.plPhoto1 = viewModel.currPhoto
                        viewModel.plPhoto2 = viewModel.currPhoto2
                        viewModel.plPhoto3 = viewModel.currPhoto3
                        viewModel.plType = viewModel.currType
                        
                        viewModel.addPlace()
                        
                        viewModel.currPhoto = ""
                        viewModel.currPhoto2 = ""
                        viewModel.currPhoto3 = ""
                        viewModel.plName = ""
                        viewModel.plLoc = ""
                        viewModel.plDescr = ""
                        viewModel.currType = "All"
                        
                        viewModel.fetchPlace()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(4)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                    })
                    .opacity(viewModel.currPhoto.isEmpty || viewModel.currPhoto2.isEmpty || viewModel.currPhoto3.isEmpty || viewModel.plName.isEmpty || viewModel.plLoc.isEmpty || viewModel.plDescr.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.currPhoto.isEmpty || viewModel.currPhoto2.isEmpty || viewModel.currPhoto3.isEmpty || viewModel.plName.isEmpty || viewModel.plLoc.isEmpty || viewModel.plDescr.isEmpty ? true : false)
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.photos, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currPhoto = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currPhoto.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 30, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currPhoto)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .cornerRadius(25)
                                        .padding(1)
                                }
                                
                            })
                            
                            Menu(content: {
                                
                                ForEach(viewModel.photos, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currPhoto2 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currPhoto2.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 30, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currPhoto2)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .cornerRadius(25)
                                        .padding(1)
                                }
                                
                            })
                            
                            Menu(content: {
                                
                                ForEach(viewModel.photos, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currPhoto3 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currPhoto3.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 30, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currPhoto3)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .cornerRadius(25)
                                        .padding(1)
                                }
                                
                            })
                        }
                        .padding(.bottom)
                        
                        HStack {
                            
                            ForEach(viewModel.types, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currType = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .medium))
                                        .padding(5)
                                        .padding(.horizontal, 5)
                                        .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim").opacity(viewModel.currType == index ? 1 : 0.5)))
                                })
                            }
                            
                            Spacer()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Name")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.plName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.plName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                            VStack(alignment: .leading, spacing: 7) {
                                
                                Text("Location")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.plLoc.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.plLoc)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                .padding(1)
                            }
                                    
                                    VStack(alignment: .leading, spacing: 7) {
                                        
                                        Text("Description")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .medium))
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            Text("Enter")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .opacity(viewModel.plDescr.isEmpty ? 1 : 0)
                                            
                                            TextField("", text: $viewModel.plDescr)
                                                .foregroundColor(Color.black)
                                                .font(.system(size: 14, weight: .semibold))
                                            
                                        })
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                        .padding(1)
                                    }
                                    .padding(.bottom)

                        }
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    AddPlace(viewModel: PlacesViewModel())
}
