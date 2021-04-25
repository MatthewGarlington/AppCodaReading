//
//  WorkingWithForEachAndList.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 1/26/21.
//

import SwiftUI

struct WorkingWithForEachAndList: View {
    
    
         var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]

        var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    
    
    
    // This goes off the seperate struct that builds a resturant view
        var restaurants = [ Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
                   Restaurant(name: "Homei", image: "homei"),
                   Restaurant(name: "Teakha", image: "teakha"),
                   Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
                   Restaurant(name: "Petite Oyster", image: "petiteoyster"),
                   Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
                   Restaurant(name: "Po's Atelier", image: "posatelier"),
                   Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                   Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
                   Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
                   Restaurant(name: "Homei", image: "upstate"),
                   Restaurant(name: "Traif", image: "traif"),
                   Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
                   Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
                   Restaurant(name: "Five Leaves", image: "fiveleaves"),
                   Restaurant(name: "Cafe Lore", image: "cafelore"),
                   Restaurant(name: "Confessional", image: "confessional"),
                   Restaurant(name: "Barrafina", image: "barrafina"),
                   Restaurant(name: "Donostia", image: "donostia"),
                   Restaurant(name: "Royal Oak", image: "royaloak"),
                   Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    // This calls the resturant var to be used in refactoring for refactored view
    var restaurant: Restaurant
   
    var body: some View {
        List {
            //This for Eeach loop uses index as a first term of the peremeter
            ForEach(1...4, id: \.self) { index in
                
                Text("item \(index)")
            
            }
            
        }
        
        // This uses a short hand that can element the need for the index permeter
        List {
            //This for Eeach loop uses index as a first term of the peremeter
            ForEach(1...4, id: \.self) {
                
                Text("item \($0)")
            
                
            }
            }

            //One Step further you do not even need the foreach function but rather just the list
        List(1...4, id: \.self) { index in
                
                Text("item \(index)")
            
                
                
            
        }
        // This uses the array of images and image names above to display
        List(restaurantNames.indices, id: \.self) { index in
            
            HStack {
                
                Image(self.restaurantImages[index])
                    .resizable()
                    .frame(width: 30, height: 40)
                    .cornerRadius(5)
                
                
                Text(self.restaurantNames[index])
        
            
            }
        
    }
        
        // This is will instead of passing a range uses the Resturant struct and the var to show all items. Shows the same view from above
        
        // By adding id as the id, with UUID varible this will not confuse any titles with the same name
        
        List(restaurants, id: \.id) { restaurant in
                HStack {
                    Image(restaurant.image)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(5)
                    Text(restaurant.name)
                }
            }
        
        // Further this can be simplified by conforming the Resturtant struct to Identifible and the id can be taken out of the List but still called
        
        List(restaurants) { restaurant in
                HStack {
                    Image(restaurant.image)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(5)
                    Text(restaurant.name)
                }
            }
        
        
        // Now refactor the Code above
        
        List(restaurants) { restaurant in
            BasicImageView(restaurant: restaurant)
            }
        
        // Refactored Code for a full image view
        
        List(restaurants) { restaurant in
            FullImageRow(restaurant: restaurant)
            }
        
        // Combining the different types of view
        
        List(restaurants.indices) { index in

            if (0...1).contains(index) {
                FullImageRow(restaurant: self.restaurants[index])
            } else {
                BasicImageView(restaurant: self.restaurants[index])
            }

        }
    }
}

struct Restaurant: Identifiable {
    
    
    var id = UUID()
    var name : String
    var image : String
    
    
}

struct WorkingWithForEachAndList_Previews: PreviewProvider {
  
    static var previews: some View {
        WorkingWithForEachAndList(restaurant: .init(id: UUID(), name: "", image: ""))
    }
}

struct BasicImageView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

struct FullImageRow: View {
    var restaurant: Restaurant

    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )

            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}
