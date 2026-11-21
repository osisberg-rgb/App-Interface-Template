//
//  AmbientBackground.swift
//  AppInterFaceTemp
//
//  Created by Oscar Isberg on 20/11/2026.
//
import SwiftUI

struct AmbientBackground: View {
    
    let theme: EventTheme
    @State private var drift = false
    
    var body: some View {
        ZStack {
            Color(hex: 0x080908)
            
            Circle()
                .fill(theme.primary)
                .frame(width: 340, height: 340)
                .blur(radius: 90)
                .opacity(0.35)
                .offset(x: drift ? -110 : -80, y: drift ? -270 : -300)
            
            Circle()
                .fill(theme.secondary)
                .frame(width: 300, height: 300)
                .blur(radius: 100)
                .opacity(0.30)
                .offset(x: drift ? 120 : 95, y: drift ? 280 : 250)
            
                .onAppear {
                    withAnimation(.easeInOut(duration: 14).repeatForever(autoreverses: true)) {
                        drift = true
                    }
                }
        
        }
    }
}
