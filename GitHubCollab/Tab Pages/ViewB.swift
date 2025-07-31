import Foundation
import SwiftUI

// Data model
struct Comment: Identifiable {
    let id = UUID()
    let name: String
    let date: String
    let rating: Int
    let comment: String
}

// Reusable review box
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

// Main view with top search bar
struct ViewC: View {
    @State private var searchText = ""

    let reviews: [Comment] = [
        Comment(name: "The Difference Baker", date: "Feb 3, 2025", rating: 5, comment: "Delicious gluten-free options!"),
        Comment(name: "Cane & Coconut", date: "Jan 18, 2025", rating: 5, comment: "Love the sandwiches."),
        Comment(name: "Rise Bakery", date: "Nov 28, 2024", rating: 5, comment: "Great service and vegan choices."),
        Comment(name: "Seoul Spice", date: "Jan 14, 2025", rating: 5, comment: "My favorite spot for coffee."),
        Comment(name: "The Difference Baker", date: "Jul 30, 2025", rating: 4, comment: "Could use more dessert options."),
        Comment(name: "100 Bowls of Soup", date: "Jul 25, 2025", rating: 5, comment: "Friendly staff and cozy vibe."),
        Comment(name: "&Pizza", date: "Jul 25, 2025", rating: 5, comment: "Friendly staff and cozy vibe."),
        Comment(name: "100 Bowls of Soup", date: "Jul 25, 2025", rating: 5, comment: "Friendly staff and cozy vibe."),
        Comment(name: "Baked by Yeal", date: "Jul 25, 2025", rating: 5, comment: "Friendly staff and cozy vibe."),
        Comment(name: "Rise Bakery", date: "Jul 25, 2025", rating: 5, comment: "Friendly staff and cozy vibe."),
        Comment(name: "Lost Dog Cafe Alexandria", date: "Jul 25, 2025", rating: 5, comment: "Friendly staff and cozy vibe.")
    ]

    var filteredReviews: [Comment] {
        if searchText.isEmpty {
            return reviews
        } else {
            return reviews.filter { comment in
                comment.name.localizedCaseInsensitiveContains(searchText) ||
                comment.comment.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        ZStack {
            Color(red: 255/255, green: 175/255, blue: 112/255)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {
                Text("Restaurant Reviews")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)

                // 🔍 Custom Search Bar at the Top
                TextField("Search reviews...", text: $searchText)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(filteredReviews) { review in
                            ViewB(name: review.name, date: review.date, rating: review.rating, comment: review.comment)
                        }
                    }
                    .padding()
                }
            }
            .padding(.top)
        }
    }
}

// Preview
#Preview {
    ViewC()
}
