//
//  WorkingWithButtons.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 1/25/21.
//

import SwiftUI

struct WorkingWithButtons: View {
    var body: some View {
        Button(action: {
            
            print("Hello world!")
        }
               , label: {
                Text("Hello World")
                    .padding()                // 1. Add the paddings
                    .background(Color.purple) // 2. Change the background color to purple including the padding
                    .foregroundColor(.white)  // 3. Set the foreground/font color to white
                    .font(.title)             // 4. Change the font type
                
        })
        
        Button(action: {
            
            print("Hello world!")
        }
               , label: {
                Text("Hello World")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                
                    .overlay(
                
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.purple, lineWidth: 5)
                
                )
                
        })
        
        Button(action: {
            print("Delete button tapped!")
        }) {
            HStack {
            Image(systemName: "trash")
                .font(.largeTitle)
                .foregroundColor(.white)
                
                
            Text("Delete")
                .fontWeight(.semibold)
                .font(.title)
                
                
                
            }
            
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(40)
        }
        
        // Button using label to show the same view as above
        
        Button(action: {
            print("Delete tapped!")
        }) {
            Label(
                title: { Text("Delete")
                    .fontWeight(.semibold)
                    .font(.title)
                },
                icon: { Image(systemName: "trash")
                    .font(.title)
                }
            )
            
            .frame(maxWidth: .infinity, minHeight: 0)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)), Color.init(#colorLiteral(red: 1, green: 0.5163516402, blue: 0.5513382554, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 40)
            .shadow(color: .gray, radius: 20.0, x: 20, y: 10)

       
        }
        
        // Button with reuseable graidiant background
        
        VStack(spacing: 30) {
            
            Button(action: {
                print("Share tapped!")
            }) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                    Text("Share")
                        .fontWeight(.semibold)
                        .font(.title)
                }
            }
            .buttonStyle(GradientBackgroundStyle())
            
            Button(action: {
                print("Edit tapped!")
            }) {
                HStack {
                    Image(systemName: "pencil.circle")
                        .font(.title)
                    Text("Edit")
                        .fontWeight(.semibold)
                        .font(.title)
                }
            }
            .buttonStyle(GradientBackgroundStyle())
            
            Button(action: {
                print("Delete tapped!")
                
            }) {
                HStack {
                    Image(systemName: "trash")
                        .font(.title)
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                }
            }
            .buttonStyle(GradientBackgroundStyle())
        }
        
        // Button that is a plus that rotates upon being pressed
        
        Button(action: {
            
            
            
        }, label: {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 60))
              

              
        }).buttonStyle(CircleBackgroundStyle())
        
        
        
        
        
    }
}

        

struct GradientBackgroundStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)), Color.init(#colorLiteral(red: 1, green: 0.4317369759, blue: 0.3690098524, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            //This is a button action animation that sinks the button down upon being pressed
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .shadow(color: .gray, radius: 20.0, x: 20, y: 10)
    }
}


struct CircleBackgroundStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.red)
            .padding()
            .cornerRadius(40)
            .padding(.horizontal, 20)
            //This is a button action animation that sinks the button down upon being pressed
            .rotationEffect(configuration.isPressed ? Angle(degrees: 0) : Angle(degrees: 135))
            .shadow(color: .gray, radius: 10.0, x: 10, y: 10)
    }
}


struct WorkingWithButtons_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithButtons()
    }
}
