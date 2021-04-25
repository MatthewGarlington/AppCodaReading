//
//  WorkingWithImages.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 1/24/21.
//

import SwiftUI

struct WorkingWithImages: View {
    var body: some View {
        
 // This is an image from the assest catelog that has an overlay image of a text view
        
        
     
 
        Image("paris")
            .resizable()
            .scaledToFit()
            .frame(width: 300)
            .clipShape(Ellipse())
            .overlay(
            

                        Text("If you are lucky enough to have lived in Paris as a young man, then wherever you go for the rest of your life it stays with you, for Paris is a moveable feast.\n\n- Ernest Hemingway")
                            .fontWeight(.heavy)
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            .opacity(0.8)
                            .padding(),

                        alignment: .center

            
            )

  // Dark the image for light text
        Image("paris")
        
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(
            
                Color.black
                    .opacity(0.4)
                    .overlay(
                        
                        Text("Paris")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                            .font(.system(.headline))
                        
                    
                    
                    )
            
            )
        
        
        
    }
}

struct WorkingWithImages_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithImages()
    }
}


// Good Shadow implementation

//Image(systemName: "cloud.snow.fill")
//    .font(.system(size: 100))
//    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//    .shadow(color: .gray, radius: 10, x: 0, y : 10)
