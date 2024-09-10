//
//  ContentView.swift
//  Test20240910
//
//  Created by Juan Manuel Moreno on 10/09/24.
//

import SwiftUI

struct GameEngine {
    var played: [[String]] = [["*", "*", "*"], ["*", "*", "*"], ["*", "*", "*"]]
    var isO: Bool
    var text: String
    
    init() {
        isO = false
        text = ""
    }
    
    mutating func move(row: Int, col: Int) {
        isO.toggle()
        played[row][col] = isO ? "O" : "X"
        text = isO ? "O" : "X"
        isAWin(row: row, col: col)
    }
    
    func isAWin(row: Int, col: Int) {
        var win = true
        
        // Row
        for col_ in 0..<3 {
            win = played[row][col_] == text
            if !win {
                break
            }
        }

        // Col
        if (win) {
            print("\(text) WINS")
//        } else {
//            win = true
//            for row_ in 0..<3  {
//                win = played[row_][col] == text
//                if !win {
//                    break
//                }
//            }
        }

//        if (win) { // TODO: Check line
    }
}

struct ContentView: View {
    
    @State private var gameEngine = GameEngine()
    
    var body: some View {
        Text("Welcome")
        VStack {
            ForEach(0..<3) { row in
                HStack {
                    ForEach(0..<3) { col in
                        Button(action: {
                            gameEngine.move(row: row, col: col)
                        })  {
                            Text(gameEngine.played[row][col])
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
