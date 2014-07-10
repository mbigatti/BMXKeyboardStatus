//
//  ViewController.swift
//  BMXKeyboardStatusTest
//
//  Created by Massimiliano Bigatti on 10/07/14.
//  Copyright (c) 2014 Massimiliano Bigatti. All rights reserved.
//

import UIKit
import BMXKeyboardStatus

class ViewController: UIViewController {
                            
    @IBAction func buttonPressed(sender: AnyObject) {
        let ks = KeyboardStatus.sharedInstance

        if ks.keyboardShowed {
            println("showed \(ks.keyboardBeginFrame) -> \(ks.keyboardEndFrame) duration=\(ks.keyboardAnimationDuration) ")
            if let curve = ks.keyboardAnimationCurve {
                println("  curve=\(curve.toRaw())")
            }
        } else {
            println("not showed")
        }
    }

}

