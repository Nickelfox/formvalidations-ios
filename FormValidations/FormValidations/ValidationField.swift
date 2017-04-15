//
//  ValidationField.swift
//  FormValidations
//
//  Created by Nickelfox on 31/03/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit
import QuartzCore

private var textFieldDidBegainEditingNotification = "UITextFieldTextDidBeginEditingNotification"
private var textFieldDidChangeNotification = "UITextFieldTextDidChangeNotification"
private var textFieldTextDidEndEditingNotification = "UITextFieldTextDidEndEditingNotification"

class ValidationField: UITextField {
    var error: String?
    var validator: ValidationProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    //MARK: Notification
    static let UITextFieldTextDidBeginEditingNotification = Notification.Name(textFieldDidBegainEditingNotification)
    static let UITextFieldTextDidChangeNotification = Notification.Name(textFieldDidChangeNotification)
    static let UITextFieldTextDidEndEditingNotification = Notification.Name(textFieldTextDidEndEditingNotification)
    
    func initialize() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleTextFieldDidBeginEditing) , name: ValidationField.UITextFieldTextDidBeginEditingNotification, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleTextFieldDidChange), name: ValidationField.UITextFieldTextDidChangeNotification, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleTextFieldDidEndEditing), name: ValidationField.UITextFieldTextDidEndEditingNotification, object: self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func validateField() -> (Bool, String?){
        if validator != nil {
            if let text = self.text {
                return self.validator?.validate(text) ?? (true, nil)
            }
        }
        return (false, nil)
    }
    
    func validateInputSilently(){
        let attempt:(isValid: Bool, error: String?) = validateField()
        self.error = attempt.error
        if attempt.isValid {
            decorateForValidInput()
        } else {
            decorateForInvalidInput()
        }
    }
    
    //MARK: Helper Methods
    
    func handleTextFieldDidBeginEditing(notification: NSNotification) {
        self.decorateForDefault()
    }
    
    func handleTextFieldDidChange(notification: NSNotification) {
        
    }
    
    func handleTextFieldDidEndEditing(notification: NSNotification) {
        self.validateInputSilently()
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
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0.5
    }
}

