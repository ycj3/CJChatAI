//
//  File.swift
//  CJChatAI
//
//  Created by Carlson Yuan on 2025/12/2.
//

import Foundation

public final class TypewriterTimer {
    private var timer: Timer?
    private var index = 0
    private let characters: [Character]
    private let interval: TimeInterval
    private let onUpdate: (String) -> Void
    private let onFinish: () -> Void
    private var currentText = ""

    public init(
        text: String,
        interval: TimeInterval = 0.02,
        onUpdate: @escaping (String) -> Void,
        onFinish: @escaping () -> Void = {}
    ) {
        self.characters = Array(text)
        self.interval = interval
        self.onUpdate = onUpdate
        self.onFinish = onFinish
    }

    public func start() {
        stop() // 防止重复定时器

        index = 0
        currentText = ""

        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] t in
            guard let self else { return }

            guard index < characters.count else {
                t.invalidate()
                onFinish()
                return
            }

            currentText.append(characters[index])
            index += 1
            onUpdate(currentText)
        }
    }

    public func stop() {
        timer?.invalidate()
        timer = nil
    }

    deinit {
        stop()
    }
}

