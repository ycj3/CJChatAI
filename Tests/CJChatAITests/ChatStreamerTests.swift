//
//  File.swift
//  CJChatAI
//
//  Created by Carlson Yuan on 2025/12/2.
//

import XCTest
@testable import CJChatAI
import Combine

final class ChatStreamerTests: XCTestCase {
    
    func testStreamMessage() async {
        let streamer = ChatStreamer()
        var received: [ChatMessage] = []
        
        for await msg in streamer.streamMessage(for: "Hello") {
            received.append(msg)
        }
        
        XCTAssertTrue(received.count > 0)
        XCTAssertEqual(received.last?.role, .assistant)
        XCTAssertTrue(((received.last?.content.contains("Markdown")) != nil))
    }
    
    func testStreamMessagePublisher() {
        let streamer = ChatStreamer()
        let expectation = XCTestExpectation(description: "Receive messages")
        var received: [ChatMessage] = []
        var cancellables = Set<AnyCancellable>()
        
        streamer.streamMessagePublisher(for: "Hello")
            .sink { completion in
                if case .finished = completion {
                    expectation.fulfill()
                }
            } receiveValue: { msg in
                received.append(msg)
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 10)
        XCTAssertTrue(received.count > 0)
        XCTAssertTrue(received.last?.content.contains("Markdown") ?? false)
    }
}
