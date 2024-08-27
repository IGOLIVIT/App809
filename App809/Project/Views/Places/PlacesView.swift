//
//  PlacesView.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI

struct PlacesView: View {

    @StateObject var viewModel = PlacesViewModel()
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

                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(4)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                    })
                }
                .padding(.vertical)
                
                Text("Places visited")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
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
                
                if viewModel.places.isEmpty {
                    
                    VStack {
                        
                        Image("grom")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90)
                        
                        Text("You haven't added any entries")
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 3))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.places.filter{($0.plType ?? "") == viewModel.currType}, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    HStack {
                                        
                                        Text(index.plName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Spacer()
                  
                                        Text(index.plType ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12, weight: .regular))
                                            .padding(4)
                                            .padding(.horizontal, 4)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                    }
                                    
                                    Text(index.plLoc ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    HStack {
                                        
                                        Image(index.plPhoto1 ?? "")
                                            .resizable()
                                            .frame(width: 190, height: 190)
                                            .cornerRadius(15)
                                        
                                        VStack {
                                            
                                            Image(index.plPhoto2 ?? "")
                                                .resizable()
                                                .frame(height: 90)
                                                .frame(maxWidth: .infinity)
                                                .cornerRadius(15)
                                            
                                            Image(index.plPhoto3 ?? "")
                                                .resizable()
                                                .frame(height: 90)
                                                .frame(maxWidth: .infinity)
                                                .cornerRadius(15)
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 220)
                                    
                                    Text(index.plDescr ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 3))
                                .padding(4)
                            }
                        }
                    }
                }
                
                
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddPlace(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchPlace()
        }
    }
}

#Preview {
    PlacesView()
}
