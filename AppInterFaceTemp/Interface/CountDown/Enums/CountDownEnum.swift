//
//  CountDownEnum.swift
//  AppInterFaceTemp
//
//  Created by Oscar Isberg on 18/11/2026.
//

import SwiftUI

enum EventTheme: String, CaseIterable, Identifiable {
    case ember, rose, amber, gold, mint, olive
    
    var id: String {rawValue}
    
    var colors: [Color] {
        switch self {
        case .ember: return [Color(hex: 0xFF7E5F), Color(hex: 0xFEB47B)]
        case .rose: return [Color(hex: 0xFF5C8A), Color(hex: 0xFF9A6C)]
        case .amber: return [Color(hex: 0xFFB300), Color(hex: 0xFF7A00)]
        case .gold: return [Color(hex: 0xE9C46A), Color(hex: 0xF4A261)]
        case .mint: return [Color(hex: 0x2ECC71), Color(hex: 0xA8E063)]
        case .olive: return [Color(hex: 0x6A994E), Color(hex: 0xA7C957)]
        }
        
    }
    
    var primary: Color { colors[0]}
    var secondary: Color {colors[1]}
    
    var gradient: LinearGradient {
        LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
