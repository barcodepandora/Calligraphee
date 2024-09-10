//
//  ContentView.swift
//  Calligraphee
//
//  Created by Juan Manuel Moreno on 9/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var points: [CGPoint] = []
    
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
        ZStack {
//            HStack(spacing: -98) {
//                CircleForSketching()
//                CircleForSketching()
//            }
            
//            Color.green
//                .contentShape(Rectangle()) // Make the entire view tappable
//                .onTapGesture { location in
//                    points.append(location)
//                }

            GestureTestView()
            
//            SwipeGestureTestView()
            
//            Path { path in
//                for point in points {
//                    path.move(to: point)
//                    path.addLine(to: point) // A single point stroke
//                }
//            }
//            .stroke(Color.white, lineWidth: 5) // Customize stroke color and width
//
            // Capture tap gestures to add points
        }
    }
}

#Preview {
    ContentView()
}
