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
    
//    class func stringValidator(with validationSelector: Selector, withErrorMessage errorMessage: String) -> StringValidator{
//        return StringValidator(withSelector: validationSelector, withErrorMessage: errorMessage)
//    }

    func validateString(_ string: NSString, withErrorMessage errorMessage: inout String) -> Bool {
        var isInputValid: Bool = false
        isInputValid = ((string.perform(validationSelector) != nil))
        if isInputValid {
            if self.errorMessage.isNonEmpty() {
                errorMessage = self.errorMessage
            } else {
                errorMessage = "Invalid Input"
            }
        }
        return isInputValid
    }
}
