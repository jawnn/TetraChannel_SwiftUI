//
//  Float+Extension.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 10/31/23.
//

import Foundation

extension Float {

    func toString(decimalDigits: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = decimalDigits
        let value = NSNumber(value: self)
        return formatter.string(from: value)!
    }

    func raceTime() -> String {
        let movedDecimals = self / 1000
        let minutes = (movedDecimals/60).rounded(.down).toString(decimalDigits: 0)
        let seconds = movedDecimals.truncatingRemainder(dividingBy: 60).toString(decimalDigits: 3)
        return "\(minutes):\(seconds)"
    }

    func durationInHours() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let value = NSNumber(value: self / 3600)
        return formatter.string(from: value)!
    }

    func durationInDays() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let value = NSNumber(value: self / 86400)
        return formatter.string(from: value)!
    }

    func durationInYears() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let value = NSNumber(value: self / 31556952)
        return formatter.string(from: value)!
    }
}
