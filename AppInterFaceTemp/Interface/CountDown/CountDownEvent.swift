//
//  CountDownEvent.swift
//  AppInterFaceTemp
//
//  Created by Oscar Isberg on 18/11/2026.
//
import SwiftUI

struct CountDownEvent: Identifiable, Equatable {
    
    let id: UUID
    var title: String
    var symbol: String
    var startDate: Date
    var targetDate: Date
    var theme: EventTheme
    
    init(id: UUID = UUID(), title: String, symbol: String, startDate: Date, targetDate: Date, theme: EventTheme) {
        self.id = id
        self.title = title
        self.symbol = symbol
        self.startDate = startDate
        self.targetDate = targetDate
        self.theme = theme
    }
    
    func isPast(from now: Date) -> Bool {
        targetDate <= now
    }
    
    func secondsLeft(from now: Date) -> Int {
        max(0, Int(targetDate.timeIntervalSince(now)))
    }
    
    func breakdown(from now: Date) -> (days: Int, hours: Int, minutes: Int, seconds: Int) {
        let s = secondsLeft(from: now)
        return (s / 86_400, (s % 86_400) / 3600, (s % 3600) / 60, s % 60)
    }
    
    func progress(at now: Date) -> Double {
        let total = targetDate.timeIntervalSince(startDate)
        guard total > 0 else {return 1}
        let elapsed = now.timeIntervalSince(startDate)
        return min(max(elapsed / total, 0), 1)
    }
}
