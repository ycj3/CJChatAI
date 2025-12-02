//
//  File.swift
//  CJChatAI
//
//  Created by Carlson Yuan on 2025/12/2.
//

import SwiftUI


public struct TypewriterText: View {
    let text: String
    let speed: TimeInterval
    
    
    @State private var displayed = ""
    
    
    public init(_ text: String, speed: TimeInterval = 0.02) {
        self.text = text
        self.speed = speed
    }
    
    
    public var body: some View {
        Text(displayed)
            .task {
                displayed = ""
                for char in text {
                    try? await Task.sleep(nanoseconds: UInt64(speed * 1_000_000_000))
                    displayed.append(char)
                }
            }
    }
}
