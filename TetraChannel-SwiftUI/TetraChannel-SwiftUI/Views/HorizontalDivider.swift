//
//  HorizontalDivider.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 11/8/23.
//

import SwiftUI

struct HorizontalDivider: View {
    var body: some View {
        Rectangle()
            .stroke(Color.brandInverse)
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
}

struct HorizontalDivider_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalDivider()
    }
}
