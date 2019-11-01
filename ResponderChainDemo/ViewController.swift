//
//  ViewController.swift
//  ResponderChainDemo
//
//  Created by Franco Risma on 31/10/2019.
//  Copyright © 2019 Franco Risma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension UILabel {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("UILabel touchesBegan()")
        next?.touchesBegan(touches, with: event)
    }
}

extension UIView {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        printChain()
//        print("UIView touchesBegan()")
        next?.touchesBegan(touches, with: event)
    }
}

extension UIViewController {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("UIViewController touchesBegan()")
        next?.touchesBegan(touches, with: event)
    }
}

extension UIWindow {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("UIWindow touchesBegan()")
        next?.touchesBegan(touches, with: event)
    }
}

extension AppDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("AppDelegate touchesBegan()")
    }
}

extension UIResponder {
    func printChain() {
        print(self)
        next?.printChain()
    }
}

