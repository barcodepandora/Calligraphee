//
//  SwipeGestureTestView.swift
//  Calligraphee
//
//  Created by Juan Manuel Moreno on 9/09/24.
//

import SwiftUI

struct SwipeGestureTestView: View {
    @State private var offset = CGSize.zero
    @State private var direction: String = ""

    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 24, height: 24)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.offset = value.translation
                        self.direction = self.getDirection(from: value.translation)
                    }
                    .onEnded { value in
                        self.offset = .zero
                    }
            )
    }

    func getDirection(from translation: CGSize) -> String {
        if translation.width > 0 {
            return "Right"
        } else if translation.width < 0 {
            return "Left"
        } else if translation.height > 0 {
            return "Down"
        } else if translation.height < 0 {
            return "Up"
        } else {
            return "Unknown"
        }
    }
}

#Preview {
    SwipeGestureTestView()
}
