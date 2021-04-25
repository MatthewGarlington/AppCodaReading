//
//  WorkingWithLayouts.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 1/24/21.
//

import SwiftUI

struct WorkingWithLayouts: View {
    var body: some View {
        
        VStack {
            
            HeaderView()
            
            
            HStack(spacing: 20) {
                
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                
                
                ZStack {
                    PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    
                    
                    Text("Best for designer")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 89)
                    
                }
                
                
            }
            
            ZStack {
                TeamView(title: "Team", price: "$299", textColor: .white, bgColor: Color.black.opacity(0.8), icon: "wand.and.rays")
                    .padding(.vertical)
                    .padding(.horizontal)
                
                Text("Best for teams of more than 20")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .offset(x: 0, y: 110)
                
            }
            
            
            
            Spacer()
        }
    }
}

struct WorkingWithLayouts_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithLayouts()
    }
}

struct HeaderView: View {
    var body: some View {
        
        
        HStack {
            
            VStack(alignment: .leading) {
                
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                
                
            }
            Spacer()
        }
        
    }
}


struct PricingView: View {
    
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    
    
    var body: some View {
        VStack {
            
            
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        
        //This lets the basic view fill up all the space to the edge of the screen
        
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}


struct TeamView: View {
    
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    
    var body: some View {
        VStack {
            
            if let icon = icon {
                
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
                
                
            }
            
            
            
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        
        //This lets the basic view fill up all the space to the edge of the screen
        
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}



