//
//  R2.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
                
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 40) {
                    
                    Text("Control your tasks with one click")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color("prim").opacity(0.4))
                            .frame(width: 9)
                        
                        Circle()
                            .fill(Color("prim"))
                            .frame(width: 9)
                        
                        Spacer()
                        
                        Button(action: {
                            
                            status = true
                            
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
                .frame(height: 200)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

#Preview {
    R2()
}
