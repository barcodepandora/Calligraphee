//
//  CircleForSketching.swift
//  Calligraphee
//
//  Created by Juan Manuel Moreno on 9/09/24.
//

import SwiftUI

struct CircleForSketching: View {
    var body: some View {
        Circle()
            .rotation3DEffect(
                .degrees(45),
                axis: (0, 1, 0), // Y axis
                anchor: .center,
                anchorZ: 0,
                perspective: 0.5
            )
            .rotation3DEffect(
                .degrees(-64),
                axis: (0, 0, 1), // Z axis
                anchor: .center,
                anchorZ: 0,
                perspective: 0.5
            )

    }
}

#Preview {
    CircleForSketching()
}
