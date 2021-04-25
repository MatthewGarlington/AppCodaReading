//
//  WorkingWithTransitions.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 1/26/21.
//

import SwiftUI

struct WorkingWithTransitions: View {
    @State private var show = false
    
    
    
    var body: some View {
 
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
                .overlay(
                    Text("Show details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                    
                )
            
            
            if show {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.purple)
                .overlay(
                    Text("Well, here is the details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                ).transition(.offsetScaleOpacity)
            }
        }
        
        .onTapGesture {
            withAnimation(Animation.spring()) {
                
                self.show.toggle()
            }
        }
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
                .overlay(
                    Text("Show details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                    
                )
            
            
            if show {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.purple)
                .overlay(
                    Text("Well, here is the details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                ).transition(.scaleAndOffset)
            }
        }
        
        .onTapGesture {
            withAnimation(Animation.spring()) {
                
                self.show.toggle()
            }
        }
    }
}

// Extension for offSetScaleOpacity Transition
extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
}
// scale with an offset transition
extension AnyTransition {
    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .scale(scale: 0, anchor: .bottom),
            removal: .offset(x: -600, y: 00)
        )
    }
}

struct WorkingWithTransitions_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithTransitions()
    }
}
