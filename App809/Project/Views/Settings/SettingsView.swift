//
//  SettingsView.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
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
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("Rate Us")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .medium))
                                
                                Spacer()
                                
                                Image("ru")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            .padding()
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 3))
                            .padding(3)
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/41f9821b-e073-4ef6-baf9-1530eca4cc97") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("Usage Policy")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .medium))
                                
                                Spacer()
                                
                                Image("up")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            .padding()
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 3))
                            .padding(3)
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
