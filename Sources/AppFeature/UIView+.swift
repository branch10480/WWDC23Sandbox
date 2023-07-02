//
//  UIView+.swift
//  WWDC23Sandbox
//
//  Created by Toshiharu Imaeda on 2023/07/02.
//

import Foundation
import SwiftUI

extension UIView {
    func add(swiftUIView view: some View) {
        let vc = UIHostingController(rootView: view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(vc.view)
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: topAnchor),
            vc.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            vc.view.leftAnchor.constraint(equalTo: leftAnchor),
            vc.view.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}
