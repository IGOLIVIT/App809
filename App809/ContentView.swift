//
//  ContentView.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Adventures

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {

                        AdventuresVeiw()
                            .tag(Tab.Adventures)
                        
                        PlacesView()
                            .tag(Tab.Places)
                        
                        NotesView()
                            .tag(Tab.Notes)

                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
