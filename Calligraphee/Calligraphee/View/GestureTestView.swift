//
//  GestureTestView.swift
//  Calligraphee
//
//  Created by Juan Manuel Moreno on 9/09/24.
//

import SwiftUI

struct GestureTestView: View {
    @State private var tapped = false
    @State private var strokes: [Stroke] = [Stroke]()
    @State private var tapLocation: CGPoint = .zero
    
    var body: some View {
//        Text("Tap me!")
//            .onTapGesture {
//                self.tapped.toggle()
//                print("Tapped!")
//            }
//            .foregroundColor(tapped ? .green : .red)
        ZStack {
                HStack(spacing: -98) {
                    CircleForSketching()
                    CircleForSketching()
                }

                Path { path in
                    for stroke in strokes {
                        path.move(to: stroke.start)
                        path.addLine(to: stroke.end)
                    }
                }
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundColor(.green)

                Rectangle()
                .fill(Color.red.opacity(0.1))
                .onTapGesture { value in
                    self.tapLocation = value
                    print("Tapped at x: \(tapLocation.x), y: \(tapLocation.y)")
//                    let newStroke = Stroke(location: tapLocation, size: 10, color: .green)
//                    self.strokes.append(newStroke)
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let currentLocation = value.location
                            if self.tapLocation != nil && self.tapLocation != .zero {
                                let newStroke = Stroke(start: self.tapLocation, end: currentLocation, size: 10, color: .green)
                                strokes.append(newStroke)
                            }
                            self.tapLocation = value.location
                        }
                        .onEnded { value in
                            print("Also i do drag")
                        }
                    )
//                            self.tapLocation = value
//                            print("Tapped at x: \(tapPoint.x), y: \(tapPoint.y)")
//                            let newStroke = Stroke(location: tapLocation, size: 10, color: .white)
//                            self.strokes.append(newStroke)
//                        }
//                )

//            ForEach(strokes.indices, id: \.self) { index in
//                Circle()
//                    .fill(strokes[index].color)
//                    .frame(width: strokes[index].size, height: strokes[index].size)
//                    .position(strokes[index].location)
//            }
        }
    }
}

struct Stroke {
//    let location: CGPoint
    let start: CGPoint
    let end: CGPoint
    let size: CGFloat
    let color: Color
}

#Preview {
    GestureTestView()
}
