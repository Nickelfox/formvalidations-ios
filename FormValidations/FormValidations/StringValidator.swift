//
//  StringValidator.swift
//  FormValidations
//
//  Created by Nickelfox on 31/03/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation

class StringValidator: NSObject {
    
    var validationSelector: Selector
    var errorMessage: String
    
    init(withSelector validationSelector: Selector,  withErrorMessage errorMessage: String)  {
        self.validationSelector = validationSelector
        self.errorMessage = errorMessage
        super.init()
    }

    func validateString(_ string: NSString, withErrorMessage errorMessage: inout String) -> Bool {
        var isInputValid: Bool = false
        isInputValid = ((string.perform(validationSelector) != nil))
        if !isInputValid {
            if self.errorMessage.isNonEmpty() {
                errorMessage = self.errorMessage
            } else {
                errorMessage = "Invalid Input"
            }
        }
        return isInputValid
    }
}

//class ValidateString: NSObject, ValidationDelegate {
//    
//    let validationFieldDemoVC = ValidationFieldDemoViewController()
//    
//    override func awakeFromNib() {
//        validationFieldDemoVC.validateStringDelegate = self
//    }
//    
//    var methodToCall: String = ""
//    func validateString(withMethod method: String, withErrorMessage: String) {
//        methodToCall = method
//    }
//    
//    enum PerformMethod: String {
//        case isNonEmpty
//        case isAlphabetic
//        case isNumeric
//        case isAlphaNumeric
//        case isValidEmail
//        case isValidURL
//        case isValidPassword
//        case isValidCreditCardExpirationDate
//        case isValidCreditCardNumber
//        case isValidCardVerificationCode
//    }
//    
//    func validateString(_ nsText: NSString) -> Bool {
//        switch methodToCall {
//        case PerformMethod.isNonEmpty.rawValue:
//            return (nsText.isNonEmpty())
//        case "isAlphabetic":
//            return (nsText.isAlphabetic())
//        case "isNumeric":
//            return (nsText.isNumeric())
//        case "isAlphaNumeric":
//            return (nsText.isAlphaNumeric())
//        case "isValidEmail":
//            return (nsText.isNonEmpty())
//        case "isValidURL":
//            return (nsText.isValidURL())
//        case "isValidPassword":
//            return (nsText.isValidPassword())
//        case "isValidCreditCardExpirationDate":
//            return (nsText.isValidCreditCardExpirationDate())
//        case "isValidCreditCardNumber":
//            return (nsText.isValidCreditCardNumber())
//        case "isValidCardVerificationCode":
//            return (nsText.isValidCardVerificationCode())
//        default:
//            break
//        }
//        return false
//    }
//}
