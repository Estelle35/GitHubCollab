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
                    Text("About")
                }
            ViewB()
                .tabItem() {
                    Image(systemName: "star")
                    Text("Ratings")
                }
        }
    }
}

#Preview {
    ContentView()
}
