//
//  File.swift
//  CJChatAI
//
//  Created by Carlson Yuan on 2025/12/2.
//

import Foundation

public struct ChatMessage: Identifiable {
    public let id = UUID()
    public let role: Role
    public let content: String
    public var animated: Bool


    public enum Role {
        case user
        case assistant
    }
    
    public init(role: Role, content: String, animated: Bool = false) {
        self.role = role
        self.content = content
        self.animated = animated
    }
}
