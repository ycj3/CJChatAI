//
//  File.swift
//  CJChatAI
//
//  Created by Carlson Yuan on 2025/12/2.
//

import SwiftUI
import Foundation
internal import MarkdownUI


public struct MarkdownRenderer: View {
    let markdown: String
    let animated: Bool
    
    
    public init(markdown: String, animated: Bool) {
        self.markdown = markdown
        self.animated = animated
    }
    
    
    public var body: some View {
        if animated {
            TypewriterText(markdown)
        } else {
            Markdown(markdown)
        }
    }
}
