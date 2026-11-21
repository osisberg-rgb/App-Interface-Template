//
//  SeachScreen.swift
//  AppInterFaceTemp
//
//  Created by Oscar Isberg on 16/11/2026.
//


import SwiftUI
import Combine

struct SeachScreen: View {
    
    
    @StateObject private var store = CountDownStore()
    @State private var now = Date()
    @State private var appeared = false
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            AmbientBackground(theme: store.featuredEvent?.theme ?? .ember)
                .ignoresSafeArea()
            content
        }
        .preferredColorScheme(.dark)
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 0.3)) { now = Date() }
            
        }
        .onAppear {
            withAnimation(.spring(response: 0.9, dampingFraction: 0.82).delay(0.1)) {
                appeared = true
            }
        }
    }
    
    private var content: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 26) {
                header
                
                if let featured = store.featuredEvent {
                    FeaturedCountDownCard(event: featured, now: now, appeared: appeared)
                    
                    ForEach(store.listEvents) { event in
                        EventRow(event: event, now: now)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.82)) {
                                    store.featuresID = event.id
                                }
                            }
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
    
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Countdown")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                Text(DF.weekday.string(from: now))
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundStyle(.white.opacity(0.5))
                
            }
            Spacer()
            Image(systemName: "plus")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 46, height: 46)
                .background(Circle().fill(.white.opacity(0.08)))
        }
    }
}
