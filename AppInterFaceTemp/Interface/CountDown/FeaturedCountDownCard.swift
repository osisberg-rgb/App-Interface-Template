//
//  FeaturedCountDownCard.swift
//  AppInterFaceTemp
//
//  Created by Oscar Isberg on 19/11/2026.
//
import SwiftUI

struct FeaturedCountDownCard: View {
    let event: CountDownEvent
    let now: Date
    let appeared: Bool
    
    private var progress: Double { event.progress(at: now) }
    
    private var bd: (days: Int, hours: Int, minutes: Int, seconds: Int) {
        event.breakdown(from: now)
    }
    
    var body: some View {
        VStack(spacing: 22) {
            topRow
            ring
            titleBlock
            ticker
        }
        .padding(24)
        .background(cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
        .shadow(color: event.theme.primary.opacity(0.25), radius: 30, y: 12)
    }
    
    
    private var topRow: some View {
        HStack {
            Image(systemName: event.symbol)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(event.theme.gradient)
                .frame(width: 46, height: 46)
                .background(event.theme.gradient.opacity(0.22))
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            Spacer()
            Text("\(Int(progress * 100))% elapsed")
                .font(.system(size: 12, weight: .semibold, design: .rounded))
                .foregroundStyle(.white.opacity(0.6))
                .padding(.horizontal, 12).padding(.vertical, 6)
                .background(Capsule().fill(.white.opacity(0.07)))
        }
    }
    
    private var ring: some View {
        ZStack {
            Circle().stroke(.white.opacity(0.06), lineWidth: 16)
            Circle()
                .trim(from: 0, to: appeared ? progress : 0)
                .stroke(event.theme.gradient, style: StrokeStyle(lineWidth: 16, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(color: event.theme.primary.opacity(0.5), radius: 10)
            VStack(spacing: 2){
                Text("\(bd.days)")
                    .font(.system(size: 76, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .contentTransition(.numericText())
                Text("DAYS LEFT")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .tracking(2)
                    .foregroundStyle(.white.opacity(0.45))
            }
        }
        .frame(width: 210, height: 210)
    }
    
    private var titleBlock: some View {
        VStack(spacing: 6){
            Text(event.title)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
            Text(DF.medium.string(from: event.targetDate))
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.5))
        }
    }
    
    private var ticker: some View {
        HStack(spacing: 10){
            TimeBlock(value: bd.hours, label: "HOURS")
            TimeBlock(value: bd.minutes, label: "MINUTES")
            TimeBlock(value: bd.seconds, label: "SECONDS")
        }
    }
    
    private var cardBackground: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 32, style: .continuous).fill(Color(hex: 0x1B1511))
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(event.theme.gradient).opacity(0.10)
        }
        
    }
    
    struct TimeBlock: View {
        let value: Int
        let label: String
        
        var body: some View {
            VStack(spacing: 6) {
                Text(String(format: "%02d", value))
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .monospacedDigit()
                    .contentTransition(.numericText())

                Text(label)
                    .font(.system(size: 10, weight: .semibold, design: .rounded))
                    .tracking(1)
                    .foregroundStyle(.white.opacity(0.4))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(RoundedRectangle(cornerRadius: 18, style: .continuous).fill(.white.opacity(0.05)))
        }
    }
    
}
