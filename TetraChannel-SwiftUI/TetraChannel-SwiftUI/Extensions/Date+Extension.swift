//
//  Date+Extension.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 11/7/23.
//

import Foundation

extension Date {
    func timeAgoText() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: .now)
    }
}
