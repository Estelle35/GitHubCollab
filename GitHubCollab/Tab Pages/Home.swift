//
//  Home.swift
//  GitHubCollab
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
            TabView {
               Home()
                    .tabItem() {
                        Image(systemName: "house")
                        .resizable()
                        .frame(width: 20, height: 20)
                        Text("Home)")
                    }
                
            
            ViewA()
                .tabItem() {
                    Image(systemName: "phone.fill")
                    Text("Ratings")
                }
            
            ViewB()
                 .tabItem() {
                     Image(systemName: "person.fill")
                     Text("About us")
                 }
          
        }
    }
}

#Preview {
    ContentView()
}

