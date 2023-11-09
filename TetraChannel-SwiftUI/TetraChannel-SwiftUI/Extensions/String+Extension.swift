//
//  String+Extension.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 11/7/23.
//

import Foundation

extension String {

    func timeElapsedSince() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: self) else {
            return "private"
        }
        return date.timeAgoText()
    }

}
