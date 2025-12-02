//
//  File.swift
//  CJChatAI
//
//  Created by Carlson Yuan on 2025/12/2.
//

import Foundation
@preconcurrency import Combine

public class ChatStreamer {
    
    public struct Config {
        public var segmentDelay: TimeInterval = 0.3 // 每段延迟
        public init(segmentDelay: TimeInterval = 0.3) {
            self.segmentDelay = segmentDelay
        }
    }
    
    public let config: Config
    
    public init(config: Config = Config()) {
        self.config = config
    }
    
    /// 分段流式消息 (AsyncSequence)
//    public func streamMessage(for input: String) -> AsyncStream<ChatMessage> {
//        AsyncStream { continuation in
//            DispatchQueue.global().async {
//                // 模拟 AI 回复分段
//                let segments = [
//                    "这是 AI 回复的第一段，支持 **Markdown**。",
//                    "第二段内容包括 `代码块` 示例。",
//                    "- 列表项1\n- 列表项2",
//                    "最后一段总结。"
//                ]
//                
//                for segment in segments {
//                    continuation.yield(ChatMessage(content: segment, role: .assistant))
//                    Thread.sleep(forTimeInterval: self.config.segmentDelay)
//                }
//                
//                continuation.finish()
//            }
//        }
//    }
    
//    // Combine Publisher 流式输出
//    public func streamMessagePublisher(for input: String) -> AnyPublisher<ChatMessage, Never> {
//        let subject = PassthroughSubject<ChatMessage, Never>()
//        DispatchQueue.global().async {
//            let response = """
//            这是 AI 回复的内容，支持 **Markdown** 和 `代码块`。
//            
//            - 列表项1
//            - 列表项2
//            """
//            
//            for (index, char) in response.enumerated() {
//                let partial = String(response.prefix(index + 1))
//                subject.send(ChatMessage(content: partial, role: .assistant))
//                Thread.sleep(forTimeInterval: 0.05)
//            }
//            subject.send(completion: .finished)
//        }
//        return subject.eraseToAnyPublisher()
//    }
}
