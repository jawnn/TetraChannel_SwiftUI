//
//  ContentView.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 10/27/23.
//

import SwiftUI

struct TetraChannelTabView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TetraChannelTabView()
    }
}
