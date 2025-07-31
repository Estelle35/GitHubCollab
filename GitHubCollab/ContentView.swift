//
//  ContentView.swift
//  GitHubCollab
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI

import Foundation
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
            ViewC()
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
