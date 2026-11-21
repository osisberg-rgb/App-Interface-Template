//
//  DaysLeftCountDown.swift
//  AppInterFaceTemp
//
//  Created by Oscar Isberg on 19/11/2026.
//

import SwiftUI

struct EventRow: View {
    let event: CountDownEvent
    let now: Date
    
    private var progress: Double {event.progress(at: now)}
    private var days: Int {event.breakdown(from: now).days}
    
    
    var body: some View {
        HStack(spacing: 16){
            ZStack {
                Circle().stroke(.white.opacity(0.08), lineWidth: 4)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(event.theme.gradient, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                Image(systemName: event.symbol)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(event.theme.gradient)
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(event.title)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                Text(DF.medium.string(from: event.targetDate))
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(.white.opacity(0.45))
            }
            
            Spacer(minLength: 8)
            
            VStack(alignment: .trailing, spacing: 0) {
                Text("\(days)")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .monospacedDigit()
                
                Text("days")
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundStyle(.white.opacity(0.4))
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color(hex: 0x171210))
                .overlay(RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .stroke(.white.opacity(0.06), lineWidth: 1))
                
        )
    }
}
