//
//  ContentView.swift
//  GitHubCollab
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI


    
struct ContentView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem() {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            ViewA()
                .tabItem() {
                    Image(systemName: "person")
                }
            ViewB()
                .tabItem() {
                    Image(systemName: "star")
                }
        }
    }
}

#Preview {
    ContentView()
}
