//
//  Secondpage.swift
//  GitHubCollab
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI
//making a class for restaurants
class Restaurant: Identifiable {
    let id = UUID()
    var glutenFree = false
    var nutFree = false
    var dairyFree = false
    var name = ""
    
    init(rName : String, rGlutenFree : Bool, rNutFree : Bool, rDairyFree : Bool) {
        name = rName
        nutFree = rNutFree
        dairyFree = rDairyFree
        glutenFree = rGlutenFree
    }
}
//end of making class

struct Secondpage: View {
    @State var glutenAllergy = false
    @State var nutAllergy = false
    @State var dairyAllergy = false
    
    @State var recommendations: [Restaurant] = [] // array of restaurants that match all allergies
    @State var lastRecommendations: [Restaurant] = [] // array of restaurants that match some allergies
    
    // function for checking which restaurants to recommend
    func recommend(allergies : [String], restaurants : [Restaurant]){
        recommendations = []
        lastRecommendations = []
        
        for restaurant in restaurants {
            var allergyCount = 0
            var match = 0
            for allergy in allergies {
                if allergy == "Gluten" {
                    allergyCount += 1
                    if restaurant.glutenFree == true {
                        match += 1
                    }
                }
                if allergy == "Nut" {
                    allergyCount += 1
                    if restaurant.nutFree == true {
                        match += 1
                    }
                }
                if allergy == "Dairy" {
                    allergyCount += 1
                    if restaurant.dairyFree == true {
                        match += 1
                    }
                }
            }
            if allergyCount == 0 {
                // If no allergies selected, show nothing
                continue
            }
            if match == allergyCount {
                recommendations.append(restaurant)
            }
            else if match > 0 {
                lastRecommendations.append(restaurant)
            }
        }
    }
    
    var selectedAllergies: [String] {
        var allergies = [String]()
        if glutenAllergy { allergies.append("Gluten") }
        if nutAllergy { allergies.append("Nut") }
        if dairyAllergy { allergies.append("Dairy") }
        return allergies
    }
    
    var body: some View {
        //variables for our initial restaurants
        let caneAndCoconut = Restaurant(rName: "Cane & Coconut", rGlutenFree: false, rNutFree: false, rDairyFree: true)
        let daikaya = Restaurant(rName: "Daikaya", rGlutenFree: false, rNutFree: true, rDairyFree: true)
        let lostDogCafeAlexandria = Restaurant(rName: "Lost Dog Cafe Alexandria", rGlutenFree: true, rNutFree: true, rDairyFree: false)
        let riseBakery = Restaurant(rName: "Rise Bakery", rGlutenFree: true, rNutFree: false, rDairyFree: false)
        let hundredBowlsOfSoup = Restaurant(rName: "100 Bowls of Soup", rGlutenFree: true, rNutFree: false, rDairyFree: true)
        let seoulSpice = Restaurant(rName: "Seoul Spice", rGlutenFree: true, rNutFree: false, rDairyFree: true)
        let restaurants = [caneAndCoconut, daikaya, lostDogCafeAlexandria, riseBakery, hundredBowlsOfSoup, seoulSpice]
        
        ZStack {
            // Background color from old code
            Color(red: 255/255, green: 244/255, blue: 214/255)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Select your allergies:")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.orange)
                
                Toggle("Gluten", isOn: $glutenAllergy)
                    .onChange(of: glutenAllergy) { _ in
                        recommend(allergies: selectedAllergies, restaurants: restaurants)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.orange))
                
                Toggle("Nut", isOn: $nutAllergy)
                    .onChange(of: nutAllergy) { _ in
                        recommend(allergies: selectedAllergies, restaurants: restaurants)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.orange))
                
                Toggle("Dairy", isOn: $dairyAllergy)
                    .onChange(of: dairyAllergy) { _ in
                        recommend(allergies: selectedAllergies, restaurants: restaurants)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.orange))
                
                Divider()
                    .background(Color.orange)
                
                if !recommendations.isEmpty {
                    Text("Restaurants matching all allergies:")
                        .font(.headline)
                        .foregroundColor(Color.orange)
                        .padding(.top, 10)
                    
                    ForEach(recommendations, id: \.id) { r in
                        Text("☀️ \(r.name)")
                            .foregroundColor(.black)
                    }
                } else if !lastRecommendations.isEmpty {
                    Text("Restaurants matching some allergies:")
                        .font(.headline)
                        .foregroundColor(Color.orange)
                        .padding(.top, 10)
                    
                    ForEach(lastRecommendations, id: \.id) { r in
                        Text("☀️ \(r.name)")
                            .foregroundColor(.black)
                    }
                } else {
                    Text("No suggestions available.")
                        .italic()
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            recommend(allergies: selectedAllergies, restaurants: restaurants)
        }
    }
}

#Preview {
    ContentView()
}
