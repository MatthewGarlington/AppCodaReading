//
//  ImplementingShapeandPaths.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 1/25/21.
//

import SwiftUI

struct ImplementingShapeandPaths: View {
    var body: some View {
        
        // Using Path to Verbal Draw
        
        Path() { path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
        }
        .stroke(Color.green, lineWidth: 10)
        
        
    // To Create the type of shape shown filled in with purple
        Path() { path in
            path.move(to: CGPoint(x: 20, y: 60))
            path.addLine(to: CGPoint(x: 40, y: 60))
            path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
            path.addLine(to: CGPoint(x: 230, y: 60))
            path.addLine(to: CGPoint(x: 230, y: 100))
            path.addLine(to: CGPoint(x: 20, y: 100))
        }
        .fill(Color.purple)
        
        
       
        
        
        
  // To create a border on a curved object or shape
        
        ZStack {
            Path() { path in
                path.move(to: CGPoint(x: 20, y: 60))
                path.addLine(to: CGPoint(x: 40, y: 60))
                path.addQuadCurve(to: CGPoint(x: 210, y: 60),

        control: CGPoint(x: 125, y: 0))
                path.addLine(to: CGPoint(x: 230, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 100))
            }
            .fill(Color.purple)

            Path() { path in
                path.move(to: CGPoint(x: 20, y: 60))
                path.addLine(to: CGPoint(x: 40, y: 60))
                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                path.addLine(to: CGPoint(x: 230, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 100))
                path.closeSubpath()
            }
            .stroke(Color.black, lineWidth: 5)
        }

    
        Path { path in
            path.move(to: CGPoint(x: 200, y: 200))
            path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 90), clockwise: true)
        }
        .fill(Color.green)
        
        // This shows a graph with segmented parts along with an offset on the purple view
        
        ZStack {
            Path { path in
        
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 190), clockwise: true)
            }
            .fill(Color(.systemYellow))

            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: Angle(degrees: 190), endAngle: Angle(degrees: 110), clockwise: true)
            }
            .fill(Color(.systemTeal))

            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: Angle(degrees: 110), endAngle: Angle(degrees: 90), clockwise: true)
            }
            .fill(Color(.systemBlue))

            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: Angle(degrees: 90.0), endAngle: Angle(degrees: 360), clockwise: true)
            }
            .fill(Color(.systemPurple))
            .offset(x: 20, y: 20)
            
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: Angle(degrees: 90.0), endAngle: Angle(degrees: 360), clockwise: true)
                path.closeSubpath()
            }
            .stroke(Color(red: 52/255, green: 52/255, blue: 122/255), lineWidth: 10)
            .offset(x: 20, y: 20)
            .overlay(
                Text("25%")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: 70, y: -125)
            )

        }
        
        
    }
}

struct ImplementingShapeandPaths_Previews: PreviewProvider {
    static var previews: some View {
        ImplementingShapeandPaths()
    }
}

// Progress Bar showing 85% progresss
struct CircularProgressBar: View {
     private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)

        var body: some View {

            ZStack {
                Circle()
                    .stroke(Color(.systemGray6), lineWidth: 20)
                    .frame(width: 300, height: 300)
                
                Circle()
                    .trim(from: 0, to: 0.85)
                    .stroke(purpleGradient, lineWidth: 20)
                    .frame(width: 300, height: 300)
                    .overlay(
                        VStack {
                            Text("85%")
                                .font(.system(size: 80, weight: .bold, design: .rounded))
                                .foregroundColor(Color(.systemGray))
                            Text("Complete")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(Color(.systemGray))
                        }
                    )

            }
    // Cicular donut graph 
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.4)
                    .stroke(Color(.systemBlue), lineWidth: 80)

                Circle()
                    .trim(from: 0.4, to: 0.6)
                    .stroke(Color(.systemTeal), lineWidth: 80)

                Circle()
                    .trim(from: 0.6, to: 0.75)
                    .stroke(Color(.systemPurple), lineWidth: 80)

                Circle()
                    .trim(from: 0.75, to: 1)
                    .stroke(Color(.systemYellow), lineWidth: 90)
                    .overlay(
                        Text("25%")
                            .font(.system(.title, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                            .offset(x: 80, y: -100)
                    )
            }
            .frame(width: 250, height: 250)
        }
    
}


struct CircularProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBar()
    }
}
