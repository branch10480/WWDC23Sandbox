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
    @State var isPaused = false
    @State var isMoonAppeared = true
    @State var wifiSignalLevel = 0.0

    var body: some View {
        VStack(spacing: 32) {
            Image(systemName: "wifi.router")
                .resizable()
                .scaledToFit()
                .frame(width: 50, alignment: .center)
                .symbolEffect(.variableColor.iterative.reversing, isActive: isActive)
            
            VStack {
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, alignment: .center)
                    .symbolEffect(.bounce, options: .repeat(2), value: bounceValue)
//                    .symbolEffect(.variableColor.iterative, options: .repeat(2), value: bounceValue)
                    .onAppear {
                        var transaction = Transaction()
                        transaction.disablesAnimations = true
                        withTransaction(transaction) {
                            bounceValue = 1
                        }
                    }

                Button("Animate") {
                    bounceValue += 1
                }
            }
            
            VStack {
                Image(systemName: isPaused ? "pause.fill" : "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .contentTransition(.symbolEffect(.replace.offUp))

                Button("Tap!") {
                    isPaused = !isPaused
                }
            }

            VStack {
                HStack(spacing: 16) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 50)

                    if isMoonAppeared {
                        Image(systemName: "moon.stars")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
//                            .symbolEffect(.disappear, isActive: !isMoonAppeared)
                            .transition(.symbolEffect(.automatic))
                    }

                    Circle()
                        .frame(width: 50, height: 50)
                }

                Button("Toggle Moon") {
                    isMoonAppeared = !isMoonAppeared
                }
            }

            VStack {
                Image(systemName: "wifi", variableValue: wifiSignalLevel)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)

                Button("Change Wifi Signal Level") {
                    let newValue = wifiSignalLevel == 1.0 ? 0 : wifiSignalLevel + 0.2
                    wifiSignalLevel = newValue
                }
            }
        }
    }
}

#Preview {
    SymbolView(isActive: true)
        .previewLayout(.sizeThatFits)
}
