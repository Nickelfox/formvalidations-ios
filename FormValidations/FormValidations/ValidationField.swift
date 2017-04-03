//
//  ValidationField.swift
//  FormValidations
//
//  Created by Nickelfox on 31/03/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit
import QuartzCore


class ValidationField: UITextField {
    var validator: StringValidator?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    //MARK: Notification
    static let UITextFieldTextDidBeginEditingNotification = Notification.Name("UITextFieldTextDidBeginEditingNotification")
    static let UITextFieldTextDidChangeNotification = Notification.Name("UITextFieldTextDidChangeNotification")
    static let UITextFieldTextDidEndEditingNotification = Notification.Name("UITextFieldTextDidEndEditingNotification")
    
    func initialize() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleTextFieldDidBeginEditing) , name: ValidationField.UITextFieldTextDidBeginEditingNotification, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleTextFieldDidChange), name: ValidationField.UITextFieldTextDidChangeNotification, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleTextFieldDidEndEditing), name: ValidationField.UITextFieldTextDidEndEditingNotification, object: self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func validateInput(withError errorMessage: inout String) -> Bool {
        //assert((validator != nil), "Validator Can't be nil")
        if (validator == nil) {
            return false
        } else {
            if let text = self.text {
                return (validator!.validateString(text as NSString, withErrorMessage: &errorMessage))
            }
            return false
        }
    }
    
    func validateInputSilently() -> Bool {
        var error = String()
        let isValid: Bool = validateInput(withError: &error)
        if isValid {
            decorateForValidInput()
        } else {
            decorateForInvalidInput()
        }
        return isValid
    }
    
    //MARK: Helper Methods
    
    func handleTextFieldDidBeginEditing(notification: NSNotification) {
        self.decorateForDefault()
    }
    
    func handleTextFieldDidChange(notification: NSNotification) {
        
    }
    
    func handleTextFieldDidEndEditing(notification: NSNotification) {
        //let _ = self.validateInputSilently()
    }
    
    func decorateForValidInput() {
        self.layer.borderColor = UIColor.green.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func decorateForInvalidInput() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func decorateForDefault() {
        self.layer.borderColor = UIColor.cyan.cgColor
        self.layer.borderWidth = 0.5
    }
}

