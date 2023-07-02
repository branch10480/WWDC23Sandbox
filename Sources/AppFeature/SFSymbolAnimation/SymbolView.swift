//
//  SymbolView.swift
//  WWDC23Sandbox
//
//  Created by Toshiharu Imaeda on 2023/07/02.
//

import SwiftUI

struct SymbolView: View {
    @State var isActive = false

    var body: some View {
        Image(systemName: "wifi.router")
            .resizable()
            .scaledToFit()
            .frame(width: 100, alignment: .center)
            .symbolEffect(.variableColor.iterative.reversing, isActive: isActive)
    }
}

#Preview {
    SymbolView(isActive: true)
        .previewLayout(.sizeThatFits)
}
