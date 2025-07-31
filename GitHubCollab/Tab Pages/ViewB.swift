//
//  ViewB.swift
//  GitHubCollab
//
//  Created by Scholar on 7/30/25.
//

import Foundation
import SwiftUI

struct ViewB: View {
    var body: some View {
        ZStack {
            Color(red: 255/255, green: 175/255, blue: 112/255)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer().frame(height: 40)

                Image("Us")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400.0, height: 450)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(radius: 5)
                    .background(Color(red: 1.0, green: 237.0/255.0, blue: 139.0/255.0))

                VStack(alignment: .leading, spacing: 12) {
                    Text("About Us")
                        .font(.title)
                        .fontWeight(.bold)
                        

                    Text("Our mission is to make dining out accessible to everyone, no matter their dietary needs and to raise awareness of life threatening allergies. Many people avoid dining out due to dietary restrictions, about 60% of young people with food allergies report that they avoid restaurants. Our goal is to change this statistic and make dining out a more relaxed experience for everyone. ")
                        .font(.body)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 30)
                .padding(.top, 20)

                Spacer()
            }
        }
    }
}

#Preview {
    ViewB()
}



