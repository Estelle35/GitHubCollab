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
    var shellfishFree = false
    var name = ""
    var url: String = ""
    
    init(rName : String, rGlutenFree : Bool, rNutFree : Bool, rDairyFree : Bool, rShellfishFree : Bool,  rURL: String) {
        name = rName
        shellfishFree = rShellfishFree
        nutFree = rNutFree
        dairyFree = rDairyFree
        glutenFree = rGlutenFree
        url = rURL
    }
}
//end of making class

struct Secondpage: View {
    @State var glutenAllergy = false
    @State var nutAllergy = false
    @State var dairyAllergy = false
    @State var shellfishAllergy = false
    
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
                if allergy == "Shellfish"{
                    allergyCount += 1
                    if restaurant.shellfishFree == true{
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
        if shellfishAllergy { allergies.append("Shellfish")}
        return allergies
    }
    
    var body: some View {
        //variables for our initial restaurants
        let caneAndCoconut = Restaurant(rName: "Cane & Coconut", rGlutenFree: false, rNutFree: false, rDairyFree: true, rShellfishFree: true, rURL: "https://www.caneandcoconut.com")
        let daikaya = Restaurant(rName: "Daikaya", rGlutenFree: false, rNutFree: true, rDairyFree: true, rShellfishFree: true, rURL: "https://www.daikaya.com"
        )
        let lostDogCafeAlexandria = Restaurant(rName: "Lost Dog Cafe Alexandria", rGlutenFree: true, rNutFree: true, rDairyFree: false, rShellfishFree: false, rURL: "https://www.lostdogcafe.com")
        let riseBakery = Restaurant(rName: "Rise Bakery", rGlutenFree: true, rNutFree: true, rDairyFree: true, rShellfishFree: true, rURL: "https://www.riseglutenfree.com" )
        let hundredBowlsOfSoup = Restaurant(rName: "100 Bowls of Soup", rGlutenFree: true, rNutFree: false, rDairyFree: true, rShellfishFree: false, rURL: "https://www.100bowlsofsoup.com")
        let seoulSpice = Restaurant(rName: "Seoul Spice", rGlutenFree: true, rNutFree: false, rDairyFree: true, rShellfishFree: false, rURL: "https://www.seoulspice.com" )
        let josephinesGF = Restaurant(rName: "Josephines GF", rGlutenFree: true, rNutFree: true, rDairyFree: false, rShellfishFree: false , rURL: "https://www.josephinegf.com/")
        let andPizza = Restaurant(rName: "&Pizza", rGlutenFree: true, rNutFree: true, rDairyFree: false, rShellfishFree: false, rURL: "https://andpizza.com/")
        let bakedByYael = Restaurant(rName: "Baked by Yael", rGlutenFree: true, rNutFree: true, rDairyFree: false, rShellfishFree: false, rURL: "https://bakedbyyael.myshopify.com/")
        
        let restaurants = [caneAndCoconut, daikaya, lostDogCafeAlexandria, riseBakery, hundredBowlsOfSoup, seoulSpice, josephinesGF, andPizza, bakedByYael]
            ZStack {
                // Background color from old code
                Color(red: 255/255, green: 244/255, blue: 214/255)
                    .ignoresSafeArea()
                VStack( alignment: .leading, spacing: 20) {
                    Text("Select your allergies:")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.orange)
                    
                    Toggle("Shellfish", isOn: $shellfishAllergy)
                        .onChange(of: shellfishAllergy) { _ in
                            recommend(allergies: selectedAllergies, restaurants: restaurants)
                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color.orange))
                    
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
                            .foregroundColor(Color.yellow)
                            .padding(.top, 10)
                        
                        ForEach(recommendations, id: \.id) { r in
                            if let url = URL(string: r.url) {
                                Link("☀️ \(r.name)", destination: url)
                                    .foregroundColor(.orange)
                            }
                        }
                    } else if !lastRecommendations.isEmpty {
                        Text("Restaurants matching some allergies:")
                            .font(.headline)
                            .foregroundColor(Color.orange)
                            .padding(.top, 10)
                        
                        ForEach(lastRecommendations, id: \.id) { r in
                            if let url = URL(string: r.url) {
                                Link("☀️ \(r.name)", destination: url)
                                    .foregroundColor(.red)
                            }
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
    Secondpage()
}

