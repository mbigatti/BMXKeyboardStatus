//
//  KeyboardStatus.swift
//  BMXKeyboardStatus
//
//  Created by Massimiliano Bigatti on 10/07/14.
//  Copyright (c) 2014 Massimiliano Bigatti. All rights reserved.
//

import UIKit

public class KeyboardStatus : NSObject {
    
    public class var sharedInstance : KeyboardStatus {
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
    
    public var keyboardShowed = false
    public var keyboardBeginFrame : CGRect?
    public var keyboardEndFrame : CGRect?
    public var keyboardAnimationDuration : Float?
    public var keyboardAnimationCurve : UIViewAnimationCurve?
    
    func registerNotifications() {
        let nc = NSNotificationCenter.defaultCenter()
        
        nc.addObserver(self, selector: "keyboardDidShow:", name: UIKeyboardDidShowNotification, object: nil)
        nc.addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unregisterNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardDidShow(notification : NSNotification) {
        keyboardShowed = true
        
        let userInfo = notification.userInfo as NSDictionary
        
        keyboardBeginFrame = userInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey).CGRectValue()
        keyboardEndFrame = userInfo.objectForKey(UIKeyboardFrameEndUserInfoKey).CGRectValue()
        keyboardAnimationDuration = userInfo.objectForKey(UIKeyboardAnimationDurationUserInfoKey).floatValue
        keyboardAnimationCurve = UIViewAnimationCurve.fromRaw(userInfo.objectForKey(UIKeyboardAnimationCurveUserInfoKey).integerValue)
    }
    
    func keyboardWillHide(notification : NSNotification) {
        keyboardShowed = false
        keyboardEndFrame = nil
        keyboardAnimationDuration = nil
        keyboardAnimationCurve = nil
    }
}
