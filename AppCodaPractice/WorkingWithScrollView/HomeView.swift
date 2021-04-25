//
//  HomeView.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 1/25/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ScrollView {
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("Monday, Jan. 25".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("Your Reading".uppercased())
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                       
         
                    
                }.padding(.horizontal)
                    Spacer()
            }
            
            VStack {
                CardView(image: "swiftuibutton", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                CardView(image: "macos", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                CardView(image: "flutter", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                CardView(image: "naturallanguage", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct HomeViewHorizontal: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("Monday, Jan. 25".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("Your Reading".uppercased())
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                       
         
                    
                }.padding(.horizontal)
                    Spacer()
            }
            
            HStack {
                
                Group {
               
                CardView(image: "swiftuibutton", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
             
                CardView(image: "macos", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                 
                CardView(image: "flutter", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
           
                CardView(image: "naturallanguage", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
                  
                    
                }     .frame(width: 300)
            }
        }
    }
}

struct HomeViewHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewHorizontal()
    }
}
