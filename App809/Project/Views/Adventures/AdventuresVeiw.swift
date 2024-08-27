//
//  AdventuresVeiw.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI

struct AdventuresVeiw: View {
    
    @StateObject var viewModel = AdventuresViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    NavigationLink(destination: {
                        
                        PlacesView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        VStack(alignment: .leading, spacing: 2) {
                            
                            Image(systemName: "airplane")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 20, weight: .semibold))
                            
                            Text("Places visited")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                            
                            Text("Sightings and locations")
                                .foregroundColor(.black)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 3))
                    })
                    
                    NavigationLink(destination: {
                        
                        NotesView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        VStack(alignment: .leading, spacing: 2) {
                            
                            Image(systemName: "doc.text.fill")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 20, weight: .semibold))
                            
                            Text("Impressions and notes")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                            
                            Text("Fix your thoughts")
                                .foregroundColor(.black)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 3))
                    })
                }
                .padding(.vertical)
                
                HStack {

                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            Text("Add a new advanture")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")).shadow(color: .gray.opacity(0.4), radius: 3))
                        

                    })
                    
                    NavigationLink(destination: {
                        
                        SettingsView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "gear")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .semibold))

                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 3))
                }
                .padding(.bottom)
                
                Text("Your adventures")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if viewModel.adventures.isEmpty {
                    
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
                            
                            ForEach(viewModel.adventures, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    HStack {
                                        
                                        Text(index.adName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        Text(index.adDate ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12, weight: .regular))
                                            .padding(4)
                                            .padding(.horizontal, 4)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                    }
                                    
                                    Text(index.adLocation ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    HStack {
                                        
                                        Image(index.adPhoto1 ?? "")
                                            .resizable()
                                            .frame(width: 190, height: 190)
                                            .cornerRadius(15)
                                        
                                        VStack {
                                            
                                            Image(index.adPhoto2 ?? "")
                                                .resizable()
                                                .frame(height: 90)
                                                .frame(maxWidth: .infinity)
                                                .cornerRadius(15)
                                            
                                            Image(index.adPhoto3 ?? "")
                                                .resizable()
                                                .frame(height: 90)
                                                .frame(maxWidth: .infinity)
                                                .cornerRadius(15)
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 220)
                                    
                                    Text(index.adDescr ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .medium))
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
            
            AddAdv(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchAdventures()
        }
    }
}

#Preview {
    AdventuresVeiw()
}
