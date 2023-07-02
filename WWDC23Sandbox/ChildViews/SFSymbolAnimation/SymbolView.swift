//
//  SymbolView.swift
//  WWDC23Sandbox
//
//  Created by Toshiharu Imaeda on 2023/07/02.
//

import SwiftUI

struct SymbolView: View {
    var body: some View {
        Image(systemName: "wifi.router")
            .resizable()
            .scaledToFit()
            .frame(width: 100, alignment: .center)
            .symbolEffect(.variableColor.iterative.reversing)
    }
}

#Preview {
    SymbolView()
        .previewLayout(.sizeThatFits)
}
