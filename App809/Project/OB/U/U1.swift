//
//  U1.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
                
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 30) {
                    
                    Text("Play and win with us")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color("prim"))
                            .frame(width: 9)
                        
                        Circle()
                            .fill(Color("prim").opacity(0.4))
                            .frame(width: 9)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            Reviews()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(width: 150, height: 50)
                                .background(RoundedRectangle(cornerRadius: 16).fill(Color("prim")))
                        })
                        
                        Spacer()
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

#Preview {
    U1()
}
