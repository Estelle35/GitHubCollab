//
//  ContentView.swift
//  GitHubCollab
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI


    
struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
               
                Color(red: 255/255, green: 175/255, blue: 112/255)
                    .frame(width: 1000, height: 1000)
                    .ignoresSafeArea()
                
                Image("Sun rays")
                
                Color(red: 255/255, green: 237/255, blue: 139/255)
                    .frame(width: 300, height: 500)
                    .clipShape(Circle())
                    .ignoresSafeArea()
                
                
                VStack {
                   
                    NavigationLink(destination: Secondpage()) {
                        Text("Echo Eschi")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hue: 0.067, saturation: 0.945, brightness: 0.895))
                            .padding(.top, 40)
                            .padding(.bottom, 20)
                    
                           
                      
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
