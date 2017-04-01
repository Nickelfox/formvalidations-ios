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
    
    init(withSelector validationSelector: Selector,  withErrorMessage errorMessage: String) {
        self.validationSelector = validationSelector
        self.errorMessage = errorMessage
    }
    
    func validateString(_ string: NSString, withErrorMessage errorMessage: inout String) -> Bool {
        var isInputValid: Bool = false
        let validSelector: Bool = string.responds(to: validationSelector)
        if validSelector {
            isInputValid = (self.perform(validationSelector, with: string) != nil)
            if isInputValid {
                if self.errorMessage.isNonEmpty() {
                    errorMessage = self.errorMessage
                } else {
                    errorMessage = "Invalid Input"
                }
            }
        } else {
            errorMessage = "Invalid validation selector"
        }
        return isInputValid
    }
}
//    func test() {
//        let selector: Selector = Selector(stringLiteral: "dismiss")
//
//    }
