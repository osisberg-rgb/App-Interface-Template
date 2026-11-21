//
//  CountDownStore.swift
//  AppInterFaceTemp
//
//  Created by Oscar Isberg on 18/11/2026.
//

import SwiftUI
import Combine

final class CountDownStore: ObservableObject {
    @Published var events: [CountDownEvent] = []
    @Published var featuresID: UUID?
    
    init() {
        let cal = Calendar.current
        let now = Date()
        func t(_ d: Int) -> Date {
            cal.startOfDay(for: cal.date(byAdding: .day, value: d, to: now)!)
        }
        func s(_ d: Int) -> Date { cal.date(byAdding: .day, value: -d, to: now)! }
        
        
        events = [
            CountDownEvent(title: "Project Deadline", symbol: "checkmark.seal.fill", startDate: s(27), targetDate: t(3), theme: .ember),
            CountDownEvent(title: "Birthday", symbol: "gift.fill", startDate: s(20), targetDate: t(12), theme: .rose),
            CountDownEvent(title: "Final Exam", symbol: "graduationcap.fill", startDate: s(30), targetDate: t(24), theme: .amber)
        ]
    }
    
    var sortedEvents: [CountDownEvent] {
        let now = Date()
        return events.filter { !$0.isPast(from: now)}
            .sorted { $0.targetDate < $1.targetDate}
    }
    
    var featuredEvent: CountDownEvent? {
        if let id = featuresID, let e = events.first(where: {$0.id == id}) {return e}
        return sortedEvents.first
        
    }
    
    var listEvents: [CountDownEvent] {
        guard let f = featuredEvent else {return []}
        return sortedEvents.filter {$0.id != f.id}
    }
    
    
}
