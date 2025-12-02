//
//  File.swift
//  CJChatAI
//
//  Created by Carlson Yuan on 2025/12/2.
//

import SwiftUI

public struct MarkdownText: View {
    let text: String
    
    public init(_ text: String) {
        self.text = text
    }
    
    public var body: some View {
        if let attributed = try? AttributedString(markdown: text) {
            Text(attributed)
        } else {
            Text(text)
        }
    }
}
