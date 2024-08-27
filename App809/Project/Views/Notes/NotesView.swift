//
//  NotesView.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI

struct NotesView: View {

    @StateObject var viewModel = NotesViewModel()
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

                }
                .padding(.vertical)
                
                Text("Impressions and notes")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            Text("Add an entry")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15.0).fill(Color("prim")))
                    })
                    .padding(1)
                    
                    ForEach(viewModel.notes, id: \.self) { index in
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {

                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text(index.notName ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                
                                Text(index.notDescr ?? "")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                HStack {
                                    
                                    Text(index.notDate ?? "")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 11, weight: .regular))
                                        .padding(4)
                                        .padding(.horizontal, 4)
                                        .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                                    
                                    Spacer()
                                    
                                    Image(index.notEmo ?? "")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 3))
                            .padding(3)
                        })
                    }
                }
                
                Spacer()
                
            }
            .padding()
        }
        .onAppear{
            
            viewModel.fetchNotes()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddNote(viewModel: viewModel)
        })
    }
}

#Preview {
    NotesView()
}
