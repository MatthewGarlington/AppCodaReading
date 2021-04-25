//
//  WorkingWithBasicAnimations.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 1/26/21.
//

import SwiftUI

struct WorkingWithBasicAnimations: View {
    
        //State varibles for animations
        @State private var circleColorChanged = false
        @State private var heartColorChanged = false
        @State private var heartSizeChanged = false
    
    
        // State varible for loading
    
        @State private var isLoading = false
    
    // State varible for progress
    @State private var progress: CGFloat = 0.0
    
    
    // Morphing a square button into a circle upon being pressed
    
    @State private var recordBegin = false
    @State private var recording = false
    
    var body: some View {
        
        // Heart Button switches back and forth upon being tapped with default animation using implicit animations
        
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
            
            
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
            
        }.animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3))
        .onTapGesture {
            self.circleColorChanged.toggle()
            self.heartColorChanged.toggle()
            self.heartSizeChanged.toggle()
        }
        
        // Loading circle animation
        
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.green, lineWidth: 5)
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
            .onAppear() {
                self.isLoading = true
            }
        
        // Loading Circle Animation with custom shape loading
        ZStack {
            
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 100, height: 100)
            
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.green, lineWidth: 7)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
                }
        }
        
        ZStack {
            
            Text("Loading")
                .font(.system(.body, design: .rounded))
                .bold()
                .offset(x: 0, y: -25)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5), lineWidth: 3)
                .frame(width: 250, height: 3)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color.green, lineWidth: 3)
                .frame(width: 30, height: 3)
                .offset(x: isLoading ? 110 : -110, y: 0)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
        }
        .onAppear() {
            self.isLoading = true
        }
        
        // Loading Progress View
        ZStack {
            Text("\(Int(progress * 100))%")
                .font(.system(.title, design: .rounded))
                .bold()
            
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 10)
                .frame(width: 150, height: 150)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.green, lineWidth: 10)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: -90))
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                self.progress += 0.05
                print(self.progress)
                if self.progress >= 1.0 {
                    timer.invalidate()
                    
                }
                
         
            }
            
            
        }
       // This shows eahc of the animating circles with a delay so they do not all appear at once
        HStack {
                        ForEach(0...4, id: \.self) { index in
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.green)
                                .scaleEffect(self.isLoading ? 0 : 1)
                                .animation(Animation.linear(duration: 0.6).repeatForever().delay(0.2 * Double(index)))
                        }
                    }
                    .onAppear() {
                        self.isLoading = true
                    }
        
        // View for Recording Button that turns from green sqaure to red circle upon being tapped 
         ZStack {

                    RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                        .frame(width: recordBegin ? 60 : 250, height: 60)
                        .foregroundColor(recordBegin ? .red : .green)
                        .overlay(
                            Image(systemName: "mic.fill")
                                .font(.system(.title))
                                .foregroundColor(.white)
                                .scaleEffect(recording ? 0.7 : 1)
                        )

                    RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                        .trim(from: 0, to: recordBegin ? 0.0001 : 1)
                        .stroke(lineWidth: 5)
                        .frame(width: recordBegin ? 70 : 260, height: 70)
                        .foregroundColor(.green)

                }
                .onTapGesture {
                    withAnimation(Animation.spring()) {
                        self.recordBegin.toggle()
                    }

                    withAnimation(Animation.spring().repeatForever().delay(0.5)) {
                        self.recording.toggle()
                    }
                }
    }
}
  

struct WorkingWithBasicAnimations_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithBasicAnimations()
    }
}
