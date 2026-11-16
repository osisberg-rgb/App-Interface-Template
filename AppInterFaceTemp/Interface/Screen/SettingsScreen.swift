//
//  SettingsScreen.swift
//  AppInterFaceTemp
//
//  Created by Oscar Isberg on 16/11/2026.
//


//
//  SeachScreen.swift
//  AppInterFaceTemp
//
//  Created by Oscar Isberg on 16/11/2026.
//


import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.purple.opacity(0.1),
                    Color.blue.opacity(0.1)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()
            
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                
                Text("Welcome to settings")
                    .padding()
            }
        }
    }
}

