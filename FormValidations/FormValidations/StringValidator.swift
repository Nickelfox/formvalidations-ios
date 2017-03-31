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
    
    func validateString(_ string: NSString, withErrorMessage errorMessage: String) {
        var isInputValid: Bool
        var validSelector: Bool = string.responds(to: validationSelector)
        if validSelector {
            //var methodSignature: NSMethodSignature? = instanci
        }
    }
    
}
    func test() {
        let selector: Selector = Selector(stringLiteral: "dismiss")

    }
