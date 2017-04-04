//
//  ValidationField.swift
//  FormValidations
//
//  Created by Nickelfox on 31/03/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit

class ValidationField: UITextField {
    
    var validator: StringValidator?
    var methodToCall: String = ""
    
    var validationFieldDemoVC: ValidationFieldDemoViewController?
    
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
    
    func validateInputSilently() {
        let isValid: Bool = validateInput()
        if isValid {
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

extension ValidationField: ValidationDelegate {
    
    enum PerformMethod: String {
        case isNonEmpty
        case isAlphabetic
        case isNumeric
        case isAlphaNumeric
        case isValidEmail
        case isValidURL
        case isValidPassword
        case isValidCreditCardExpirationDate
        case isValidCreditCardNumber
        case isValidCardVerificationCode
    }
    
    func validateString(withMethod method: String, withErrorMessage: String) {
        methodToCall = method
    }
    
    func validateInput() -> Bool {
        var text = String()
            if let value = self.text {
                text = value
            }

        switch methodToCall {
        case PerformMethod.isNonEmpty.rawValue:
            return (text.isNonEmpty())
        case "isAlphabetic":
            return (text.isAlphabetic())
        case "isNumeric":
            return (text.isNumeric())
        case "isAlphaNumeric":
            return (text.isAlphaNumeric())
        case "isValidEmail":
            return (text.isValidEmail())
        case "isValidURL":
            return (text.isValidURL())
        case "isValidPassword":
            return (text.isValidPassword())
        case "isValidCreditCardExpirationDate":
            return (text.isValidCreditCardExpirationDate())
        case "isValidCreditCardNumber":
            return (text.isValidCreditCardNumber())
        case "isValidCardVerificationCode":
            return (text.isValidCardVerificationCode())
        default:
            break
        }
        return false
    }
}

