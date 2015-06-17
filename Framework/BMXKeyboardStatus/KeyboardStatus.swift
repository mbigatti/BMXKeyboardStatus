//
//  KeyboardStatus.swift
//  BMXKeyboardStatus
//  https://github.com/mbigatti/BMXKeyboardStatus
//
//  Copyright (c) 2014 Massimiliano Bigatti. All rights reserved.
//

import UIKit

/**
    A simple component that provides informations about the keyboard.
 */
public class KeyboardStatus : NSObject {

    /// singleton shared instance
    public class var sharedInstance : KeyboardStatus {
        struct Static {
            static let instance : KeyboardStatus = KeyboardStatus()
        }
        return Static.instance
    }
    
    override init() {
        super.init()
        registerNotifications()
    }
    
    deinit {
        unregisterNotifications()
    }
    
    /// keyboard is on screen
    public var keyboardShowed = false
    
    /// keyboard frame (animation origin)
    public var keyboardBeginFrame : CGRect?
    
    /// keyboard frame (animation end)
    public var keyboardEndFrame : CGRect?
    
    /// keyboard animation duration
    public var keyboardAnimationDuration : Float?
    
    /// keyboard animation curve
    public var keyboardAnimationCurve : UIViewAnimationCurve?
    
    /**
        Register notifications about showing / hiding of the on screen keyboard
     */
    func registerNotifications() {
        let nc = NSNotificationCenter.defaultCenter()
        
        nc.addObserver(self, selector: "keyboardDidShow:", name: UIKeyboardDidShowNotification, object: nil)
        nc.addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    /**
        Unregister notifications
     */
    func unregisterNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    /**
        Keyboard was shown callback function
    
        - parameter notification: notification
     */
    func keyboardDidShow(notification : NSNotification) {
        keyboardShowed = true
        
        let userInfo = notification.userInfo! as NSDictionary
        
        keyboardBeginFrame = userInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.CGRectValue
        keyboardEndFrame = userInfo.objectForKey(UIKeyboardFrameEndUserInfoKey)!.CGRectValue
        keyboardAnimationDuration = userInfo.objectForKey(UIKeyboardAnimationDurationUserInfoKey)!.floatValue
        keyboardAnimationCurve = UIViewAnimationCurve(rawValue: userInfo.objectForKey(UIKeyboardAnimationCurveUserInfoKey)!.integerValue)
    }
    
    /**
        Keyboard was hide callback function
    
        - parameter notification: notification
    */
    func keyboardWillHide(notification : NSNotification) {
        keyboardShowed = false
        keyboardEndFrame = nil
        keyboardAnimationDuration = nil
        keyboardAnimationCurve = nil
    }
}
