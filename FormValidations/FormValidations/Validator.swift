//
//  Validator.swift
//  FormValidations
//
//  Created by Vaibhav Parmar on 15/04/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation

private let emptyStringError = "Value Required"
private let nameError = ["First Name and Last Name Required", "Invalid Characters"]
private let emailError = "Invalid Email"
private let phoneError = "Invalid Phone"
private let alphaNumericError = "Alpha Numeric Value Required"
private let urlError = "Invalid URL"
private let passwordError = "Must be of atleast 8 characters"
private let pincodeError = "Invalid PIN Code"
private let ccExpiryError = "Credit Card Expired"
private let ccNumberError = "Invalid Credit Card Number"
private let ccVerificationError = "Invalid Credit Card Verification Number"

protocol ValidationProtocol {
    func validate(_ value: String) -> (Bool, String?)
}

class EmptyValidation: ValidationProtocol {
    func validate(_ value: String) -> (Bool, String?) {
        if !value.isEmpty {
            return (true, nil)
        }
        return (false, emptyStringError)
    }
}

class NameValidation: ValidationProtocol {
    
    func validate(_ value: String) -> (Bool, String?) {
        if !value.isAlphabetic() {
            return (false, nameError[1])
        }
        let name: [String] = value.components(separatedBy: " ")
        if name.count == 2 && name[1].characters.count > 1 {
            return (true, nil)
        }
        return (false, nameError[0])
    }
}

class EmailValidation: ValidationProtocol {
    func validate(_ value: String) -> (Bool, String?) {
        if value.isValidEmail() {
            return (true, nil)
        }
        return (false, emailError)
    }
}

class PhoneValidation: ValidationProtocol {
    func validate(_ value: String) -> (Bool, String?) {
        if value.isValidPhone() {
            return (true, nil)
        }
        return (false, phoneError)
    }
}

class AlphaNumericValidation: ValidationProtocol {
    func validate(_ value: String) -> (Bool, String?) {
        if value.isAlphaNumeric() {
            return (true, nil)
        }
        return (false, alphaNumericError)
    }
}

class UrlValidation: ValidationProtocol {
    func validate(_ value: String) -> (Bool, String?) {
        if value.isValidURL() {
            return (true, nil)
        }
        return (false,  urlError)
    }
}

class PasswordValidation: ValidationProtocol {
    func validate(_ value: String) -> (Bool, String?) {
        if value.isValidPassword() {
            return (true, nil)
        }
        return (false, passwordError)
    }
}

class PinCodeValidation: ValidationProtocol {
    func validate(_ value: String) -> (Bool, String?) {
        if value.isValidPinCode() {
            return (true, nil)
        }
        return (false, pincodeError)
    }
}

class CCExpiryDateValidation: ValidationProtocol {
    func validate(_ value: String) -> (Bool, String?) {
        if value.isValidCreditCardExpirationDate() {
            return (true, nil)
        }
        return (false, ccExpiryError)
    }
}

class CCNumberValidation: ValidationProtocol {
    func validate(_ value: String) -> (Bool, String?) {
        if value.isValidCreditCardNumber() {
            return (true, nil)
        }
        return (false, ccNumberError)
    }
}

class CCVerificationCodeValidation: ValidationProtocol {
    func validate(_ value: String) -> (Bool, String?) {
        if value.isValidCardVerificationCode() {
            return (true, nil)
        }
        return (false, ccVerificationError)
    }
}
