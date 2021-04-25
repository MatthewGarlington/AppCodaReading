//
//  SwiftUIState.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 1/25/21.
//

import SwiftUI

struct WorkingWithStateBind: View {
    
   @State private var isPlaying = false
   @State private var counter = 0

    
    var body: some View {
        Button(action: {
           
            
            // Switch between the play and stop button
            
            
            self.isPlaying.toggle()
        
        
        }) {
            Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
            .font(.system(size: 150))
                .foregroundColor(isPlaying ? .red : .green)
        }
        
        
        // This shows mutiple counters that DO NOT use binding but rather just state so they are counted independtly
        
        VStack {
            
            CounterView(color: .blue)
            CounterView(color: .red)
            CounterView(color: .green)
            
            
    }
        
        
        
        // This shows multiple counters that are binded together so no matter what button is pressed the number is added to all
        
        VStack {
            
            BindingCounterView(counter: $counter, color: .blue)
            
            BindingCounterView(counter: $counter, color: .green)
            
            BindingCounterView(counter: $counter, color: .red)
    }
}

struct WorkingWithStateBind_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithStateBind()
    }
}

struct BindingCounterView: View {
   
    // using binding to make sure the tapped number is always added together
    
    @Binding var counter: Int
    
    var color: Color
    
    var body: some View {
        
            Button(action: {
                
                
                // Adds one to ispressed var everytime the button is pressed
                
                
                self.counter += 1
                
                
            }) {
                
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(color)
                    .overlay (
                        
                        Text("\(counter)")
                            .fontWeight(.bold)
                            .font(.system(size: 75))
                            .foregroundColor(.white)
                        
                        
                        
                    )
                
            }
        }
    }
}


struct CounterView: View {
   
    // using binding to make sure the tapped number is always added together
    
    @State var counterSingle = 0
    
    var color: Color
    
    var body: some View {
        
            Button(action: {
                
                
                // Adds one to ispressed var everytime the button is pressed
                
                
                self.counterSingle += 1
                
                
            }) {
                
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(color)
                    .overlay (
                        
                        Text("\(counterSingle)")
                            .fontWeight(.bold)
                            .font(.system(size: 75))
                            .foregroundColor(.white)
                        
                        
                        
                    )
            
                
            }
        }
    }

