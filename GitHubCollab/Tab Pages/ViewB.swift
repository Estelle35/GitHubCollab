//
//  ViewB.swift
//  GitHubCollab
//
//  Created by Scholar on 7/30/25.
//

import Foundation
import SwiftUI

struct ViewB: View {
    let name: String
    let date: String
    let rating: Int
    let comment: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("\(name) on \(date)")
                .font(.subheadline)
                .underline()
            
            HStack(spacing: 3) {
                ForEach(0..<rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                }
            }
            .foregroundColor(.black)
            .font(.footnote)
            
            Text(comment)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(19)
        .shadow(radius: 2)
    }

}

struct ViewC: View {
    var body: some View {
        ZStack {
            Color(red:255/255, green: 175/255, blue: 112/255)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 40) {
                Text("Restaurant Reviews")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                ScrollView {
                    VStack(spacing: 20) {
                        ViewB(name: "Tammy", date: "Feb 3, 2025", rating: 5, comment: "")
                        ViewB(name: "Tina", date: "Jan 18, 2025", rating: 5, comment: "")
                        ViewB(name: "Cathy", date: "Nov 28, 2024", rating: 5, comment: "")
                        ViewB(name: "Soraida", date: "Jan 14, 2025", rating: 5, comment: "")
                        ViewB(name: "Leo", date: "Jul 30, 2025", rating: 4, comment: "")
                        ViewB(name: "Ava", date: "Jul 25, 2025", rating: 5, comment: "")
                    }
                    .padding()
                }
            }
        }
    }

}
        #Preview{
            //    ViewB(name: "Sam", date: "July 31, 2025", rating: 4, comment: "Nice and simple!")
            ViewC()
        }

