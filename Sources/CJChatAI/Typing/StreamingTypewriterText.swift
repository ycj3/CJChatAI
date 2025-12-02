//
//  File.swift
//  CJChatAI
//
//  Created by Carlson Yuan on 2025/12/2.
//

import SwiftUI

public struct StreamingTypewriterText: View {
    let fullText: String
    let speed: TimeInterval
    
    @State private var currentText: String = ""
    @State private var typewriter: TypewriterTimer?

    public init(fullText: String, speed: TimeInterval = 0.02) {
        self.fullText = fullText
        self.speed = speed
    }

    public var body: some View {
        Text(currentText)
            .onAppear {
                startTyping()
            }
            .onDisappear {
                typewriter?.stop()
            }
    }

    private func startTyping() {
        typewriter = TypewriterTimer(
            text: fullText,
            interval: speed,
            onUpdate: { updated in
                self.currentText = updated
            }
        )
        typewriter?.start()
    }
}

