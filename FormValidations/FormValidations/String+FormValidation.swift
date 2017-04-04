//
//  Validation.swift
//  FormValidations
//
//  Created by Nickelfox on 30/03/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation

let alphabeticRegx = "^[A-z]+$"

let alphaNumericRegx = "[a-zA-Z0-9]+$"
let numericRegx = "[0-9]+$"
let emailRegx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"


extension NSString {
    func isNonEmpty() -> Bool {
        //return (self.characters.count) != 0
        return (self.length) != 0
    }
    
    func isAlphabetic() -> Bool {
        if isNonEmpty() {
            let alphabeticTest = NSPredicate(format: "SELF MATCHES %@", alphabeticRegx)
            return alphabeticTest.evaluate(with: self)
        } else {
            return false
        }
    }
    
    func isNumeric() -> Bool {
        if isNonEmpty() {
            let numericTest = NSPredicate(format: "SELF MATCHES %@", numericRegx)
            return numericTest.evaluate(with: self)
        } else {
            return false
        }
    }
    
    func isAlphaNumeric() -> Bool {
        if isNonEmpty() {
            let alphaNumericTest = NSPredicate(format: "SELF MATCHES %@", alphaNumericRegx)
            return alphaNumericTest.evaluate(with: self)
        } else {
            return false
        }
    }
    
   func isValidEmail() -> Bool {
        if isNonEmpty() {
            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegx)
            return emailTest.evaluate(with: self)
        } else {
            print(self.isNonEmpty())
            return false
        }
    }
    
    func isValidURL() -> Bool {
        let url: URL = URL(fileURLWithPath: self as String)
        if let _ = url.scheme, let _ = url.host {
            return true
        } else {
            return false
        }
    }
    
    func isValidPassword() -> Bool {
        return self.length >= 6
    }
    
    func isValidCreditCardExpirationDate() -> Bool {
        if self.length < 4 {
            return false
        }
        let slashIndex: NSRange = (self as NSString).range(of: "/")
        if slashIndex.location == 0 {
            return false
        }
        var monthString: String = self.components(separatedBy: "/")[0]
        var yearString: String = self.components(separatedBy: "/")[1]
        if monthString.characters.count < 0 || yearString.characters.count < 0 {
            return false
        }
        if let month = Int(monthString), var year = Int(yearString) {
            let currentYear: Int = Calendar.current.component(.year, from: Date())
            let currentMonth: Int = Calendar.current.component(.month, from: Date())
            if year > 50 {
                return false
            }
            if yearString.characters.count <= 2 {
                year += 2000
            }
            if year == currentYear {
                return ((month >= currentMonth) && (month <= 12) && (month != 0))
            }
            return ((year >= currentYear) && (month <= 12) && (month != 0))
        }
        return true
    }
    
    func isValidCreditCardNumber () -> Bool {
        let digitString = extractDigits(from: self as String)
        if digitString.characters.count < 12 || digitString.characters.count > 20 {
            return false
        }
        let verification: Int = luhnAlgorithm(digitString)
        var range = NSRange()
        range.location = digitString.characters.count - 1
        range.length = 1
        var verificationChar = unichar()
        (digitString as NSString).getCharacters(&verificationChar, range: range)
        if unicharTo(int: verificationChar)%10 == verification {
            return true
        } else {
            return false
        }
    }
    
    func isValidCardVerificationCode() -> Bool {
        var digitString = extractDigits(from: self as String)
        let digitStringLength = digitString.characters.count
        if (self.length == digitStringLength) && (digitStringLength == 3 || digitStringLength == 4) && (digitString != "000") && (digitString != "0000") {
            return true
        }
        return false
    }
}

//MARK: Helper Methods

func unicharTo(int value: unichar) -> Int {
    return Int(value) - .allZeros
}

func luhnAlgorithm (_ cardNumber: String) -> Int {
    let length: Int = (cardNumber.characters.count) - 1
    let buffer = [unichar](repeating: unichar(), count: length)
    var range = NSRange()
    range.location = 0
    range.length = length
    (cardNumber as NSString).getCharacters(UnsafeMutablePointer(mutating: buffer), range: range)
    var sum: Int = 0
    var doubleDigit: Bool = true
    var i = length - 1
    while i >= 0 {
        var value: Int = unicharTo(int: buffer[i])
        if doubleDigit {
            value *= 2
            value = value/10 + value%10
        }
        sum += value
        doubleDigit = !doubleDigit
        i -= 1
    }
    return (10 - (sum%10))%10
}

func extractDigits(from string: String) -> String {
    var strippedString = String()
    let scanner = Scanner(string: string)
    let numbers = CharacterSet(charactersIn: "0123456789")
    while scanner.isAtEnd == false {
        var buffer = NSString()
        if scanner.scanCharacters(from: numbers, into: AutoreleasingUnsafeMutablePointer(&buffer)) {
            strippedString += buffer as String
        } else {
            scanner.scanLocation += 1
        }
    }
    return strippedString
}



