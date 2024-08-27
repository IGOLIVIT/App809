//
//  AddNote.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI

struct AddNote: View {

    @StateObject var viewModel: NotesViewModel
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
                        
                        viewModel.notEmo = viewModel.currentEmo
                        
                        viewModel.addNote()
                        
                        viewModel.currentEmo = ""
                        viewModel.notName = ""
                        viewModel.notDate = ""
                        viewModel.notDescr = ""
                        
                        viewModel.fetchNotes()
                        
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
                    .opacity(viewModel.currentEmo.isEmpty || viewModel.notName.isEmpty || viewModel.notDate.isEmpty || viewModel.notDescr.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.currentEmo.isEmpty || viewModel.notName.isEmpty || viewModel.notDate.isEmpty || viewModel.notDescr.isEmpty ? true : false)
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {

                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Name")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.notName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.notName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    Text("Date")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.notDate.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.notDate)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                    .padding(1)
                                }
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    Text("Emoji")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    HStack {
                                        
                                        ForEach(viewModel.emojies, id: \.self) { index in
                                        
                                            Button(action: {
                                                
                                                viewModel.currentEmo = index
                                                
                                            }, label: {
                                                
                                                Image(index)
                                                    .resizable()
                                                    .frame(width: 40, height: 40)
                                                    .padding(3)
                                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(viewModel.currentEmo == index ? 1 : 0)))
                                            })
                                        }
                                        
                                        Spacer()
                                    }
                                }
                            }
                                    
                                    VStack(alignment: .leading, spacing: 7) {
                                        
                                        Text("Description")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .medium))
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            Text("Enter")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .opacity(viewModel.notDescr.isEmpty ? 1 : 0)
                                            
                                            TextField("", text: $viewModel.notDescr)
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
    AddNote(viewModel: NotesViewModel())
}
