//
//  ViewController.swift
//  ResponderChainDemo
//
//  Created by Franco Risma on 31/10/2019.
//  Copyright © 2019 Franco Risma. All rights reserved.
//

import UIKit

@objc protocol ListAction: AnyObject {
    func didDoSomething(_ sender: UIViewController)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UIApplication.shared.sendAction(#selector(ListAction.didDoSomething(_:)), to: nil, from: self, for: nil)
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
    
    @objc func didDoSomething(_ sender: UIViewController) {
        print("Doing something")
//        if let object = sender.selectedObject {
//            // present the detail view controller
//        }
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
    
    @objc func doSomething() {
        print("AppDelegate: doing something")
    }
}

extension UIResponder {
    func printChain() {
        print(self)
        next?.printChain()
    }
}

