//
//  ViewA.swift
//  GitHubCollab
//
//  Created by Scholar on 7/30/25.
//

import Foundation
import SwiftUI

struct ViewA: View {
    var body: some View {
        ZStack {
            Color(red: 255/255, green: 175/255, blue: 112/255)
                .ignoresSafeArea()
            VStack{
                Text("This page is unfinished!")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                }

            }
        }
    }
}

#Preview {
    ViewA()
}
