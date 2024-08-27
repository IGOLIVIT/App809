//
//  LodingView.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI

struct LodingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(50)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 60)
            }
        }
    }
}

#Preview {
    LodingView()
}
