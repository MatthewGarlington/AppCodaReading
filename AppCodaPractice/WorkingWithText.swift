//
//  ContentView.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 1/24/21.
//

import SwiftUI

struct WorkingWithText: View {
    var body: some View {
 
        Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
            
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.gray)
            .truncationMode(.head)
            .lineLimit(nil)
            .multilineTextAlignment(.center)
            .padding()
//            .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
//            .shadow(color: .gray, radius: 2, x: 0, y: 15)
        
          
    }
}

struct WorkingWithText_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithText()
    }
}
