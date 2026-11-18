//
//  DateFormattingEnum.swift
//  AppInterFaceTemp
//
//  Created by Oscar Isberg on 18/11/2026.
//

import SwiftUI

enum DF {
    static let medium: DateFormatter = {
        let f = DateFormatter(); f.locale = Locale(identifier: "en_US")
        f.dateFormat = "d MMM yyyy"; return f
    }()
    static let weekday: DateFormatter = {
        let f = DateFormatter(); f.locale = Locale(identifier: "en_US")
        f.dateFormat = "EEEE, d MMMM"; return f
    }()
}
