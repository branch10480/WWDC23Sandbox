//
//  SFSymbolAnimationViewController.swift
//  WWDC23Sandbox
//
//  Created by Toshiharu Imaeda on 2023/07/02.
//

import UIKit
import SwiftUI

class SFSymbolAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

private extension SFSymbolAnimationViewController {
    func setup() {
        title = "SFSymbol Animation"
        view.add(swiftUIView: SymbolView())
    }
}