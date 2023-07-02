//
//  SymbolView.swift
//  WWDC23Sandbox
//
//  Created by Toshiharu Imaeda on 2023/07/02.
//

import SwiftUI

struct SymbolView: View {
    @State var isActive = false
    @State var bounceValue: Int = 0

    var body: some View {
        VStack(spacing: 32) {
            Image(systemName: "wifi.router")
                .resizable()
                .scaledToFit()
                .frame(width: 100, alignment: .center)
                .symbolEffect(.variableColor.iterative.reversing, isActive: isActive)

            VStack {
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, alignment: .center)
//                    .symbolEffect(.bounce, options: .repeat(2), value: bounceValue)
                    .symbolEffect(.variableColor.iterative, options: .repeat(2), value: bounceValue)

                Button("Animate") {
                    bounceValue += 1
                }
            }
        }
    }
}

#Preview {
    SymbolView(isActive: true)
        .previewLayout(.sizeThatFits)
}
