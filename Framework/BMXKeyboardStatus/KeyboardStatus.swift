//
//  KeyboardStatus.swift
//  BMXKeyboardStatus
//
//  Created by Massimiliano Bigatti on 10/07/14.
//  Copyright (c) 2014 Massimiliano Bigatti. All rights reserved.
//

import UIKit

class KeyboardStatus : NSObject {
    
    class var sharedInstance : KeyboardStatus {
        struct Static {
            static let instance : KeyboardStatus = KeyboardStatus()
        }
        return Static.instance
    }
    
    init() {
        super.init()
        registerNotifications()
    }
    
    deinit {
        unregisterNotifications()
    }
    
    var keyboardShowed = false
    var keyboardBeginFrame : CGRect?
    var keyboardEndFrame : CGRect?
    var keyboardAnimationDuration : Float?
    var keyboardAnimationCurve : UIViewAnimationCurve?
    
    func registerNotifications() {
        let nc = NSNotificationCenter.defaultCenter()
        
        nc.addObserver(self, selector: "keyboardDidShow:", name: UIKeyboardDidShowNotification, object: nil)
        nc.addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unregisterNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    @objc func keyboardDidShow(notification : NSNotification) {
        keyboardShowed = true
        
        let userInfo = notification.userInfo as NSDictionary
        
        keyboardBeginFrame = userInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey).CGRectValue()
        keyboardEndFrame = userInfo.objectForKey(UIKeyboardFrameEndUserInfoKey).CGRectValue()
        keyboardAnimationDuration = userInfo.objectForKey(UIKeyboardAnimationDurationUserInfoKey).floatValue
        keyboardAnimationCurve = UIViewAnimationCurve.fromRaw(userInfo.objectForKey(UIKeyboardAnimationCurveUserInfoKey).integerValue)
    }
    
    @objc func keyboardWillHide(notification : NSNotification) {
        keyboardShowed = false
        keyboardEndFrame = nil
        keyboardAnimationDuration = nil
        keyboardAnimationCurve = nil
    }
}
