//
//  AddAdv.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI

struct AddAdv: View {
    
    @StateObject var viewModel: AdventuresViewModel
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
                        
                        viewModel.adPhoto1 = viewModel.currAdPhoto
                        viewModel.adPhoto2 = viewModel.currAdPhoto2
                        viewModel.adPhoto3 = viewModel.currAdPhoto3
                        
                        viewModel.addAdventure()
                        
                        viewModel.currAdPhoto = ""
                        viewModel.currAdPhoto2 = ""
                        viewModel.currAdPhoto3 = ""
                        viewModel.adName = ""
                        viewModel.adLocation = ""
                        viewModel.adDate = ""
                        viewModel.adDescr = ""
                        
                        viewModel.fetchAdventures()
                        
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
                    .opacity(viewModel.currAdPhoto.isEmpty || viewModel.currAdPhoto2.isEmpty || viewModel.currAdPhoto3.isEmpty || viewModel.adName.isEmpty || viewModel.adLocation.isEmpty || viewModel.adDescr.isEmpty || viewModel.adDate.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.currAdPhoto.isEmpty || viewModel.currAdPhoto2.isEmpty || viewModel.currAdPhoto3.isEmpty || viewModel.adName.isEmpty || viewModel.adLocation.isEmpty || viewModel.adDescr.isEmpty || viewModel.adDate.isEmpty ? true : false)
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.photos, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currAdPhoto = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currAdPhoto.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 30, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currAdPhoto)
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
                                        
                                        viewModel.currAdPhoto2 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currAdPhoto2.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 30, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currAdPhoto2)
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
                                        
                                        viewModel.currAdPhoto3 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currAdPhoto3.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 30, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currAdPhoto3)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .cornerRadius(25)
                                        .padding(1)
                                }
                                
                            })
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
                                    .opacity(viewModel.adName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.adName)
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
                                        .opacity(viewModel.adLocation.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.adLocation)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                .padding(1)
                            }
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    Text("Date")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.adDate.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.adDate)
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
                                                .opacity(viewModel.adDescr.isEmpty ? 1 : 0)
                                            
                                            TextField("", text: $viewModel.adDescr)
                                                .foregroundColor(Color.black)
                                                .font(.system(size: 14, weight: .semibold))
                                            
                                        })
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                        .padding(1)
                                    }
                                    .padding(.bottom)
                            
                            HStack {
                                
                                Text("History")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .medium))
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isAddHis = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .semibold))
                                })
                            }
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                LazyVStack {
                                    
                                    ForEach(viewModel.histories.filter{($0.hisAdv ?? "") == viewModel.adName}, id: \.self) { index in
                                    
                                        HStack {
                                            
                                            Image(index.hisPhoto ?? "")
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                                .cornerRadius(13)
                                            
                                            VStack(alignment: .leading) {
                                                
                                                Text(index.hisName ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 14, weight: .medium))
                                                
                                                Text(index.hisDescr ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        .padding(8)
                                        .frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 3))
                                        .padding(3)
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddHis ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddHis = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Text("History")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddHis = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Menu(content: {
                        
                        ForEach(viewModel.photos, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currHisPhoto = index
                                
                            }, label: {
                                
                                Image(index)
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.currHisPhoto.isEmpty {
                            
                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                                .font(.system(size: 30, weight: .regular))
                                .frame(width: 100, height: 100)
                                .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                                .padding(1)
                            
                        } else {
                            
                            Image(viewModel.currHisPhoto)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(25)
                                .padding(1)
                        }
                        
                    })
                    
                    VStack(alignment: .leading, spacing: 7) {
                        
                        Text("Name")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.hisName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.hisName)
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
                                .opacity(viewModel.hisDescr.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.hisDescr)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                    }
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.currHisPhoto = ""
                            viewModel.hisName = ""
                            viewModel.hisDescr = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddHis = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                .padding(1)
                        })
                        
                        Button(action: {
                            
                            viewModel.hisAdv = viewModel.adName
                            viewModel.hisPhoto = viewModel.currHisPhoto
                            
                            viewModel.addHistory()
                            
                            viewModel.currHisPhoto = ""
                            viewModel.hisName = ""
                            viewModel.hisDescr = ""
                            
                            viewModel.fetchHistorys()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddHis = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                .padding(1)
                            
                        })
                    }
                    .padding(.vertical)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                .padding()
                .offset(y: viewModel.isAddHis ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchHistorys()
        }
    }
}

#Preview {
    AddAdv(viewModel: AdventuresViewModel())
}
