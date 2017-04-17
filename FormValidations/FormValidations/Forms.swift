//
//  Forms.swift
//  FormValidations
//
//  Created by Vaibhav Parmar on 17/04/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

protocol ValidationDelegate: class {
    func isValidationSucessfull()
    func isValidationFailed(_ errors: [String])
}

class Forms {
    
    var validationRules: [ValidationRule] = []
    var validationErrors: [String] = []
    
    func registerField(textField: UITextField, validator: ValidationProtocol) {
        validationRules.append(ValidationRule(textField: textField, rule: validator))
    }
    
    func validateAllFields(_ delegate: ValidationDelegate) {
        for validationRule in validationRules {
            let attempt:(isValid: Bool, error: String?) = validationRule.validateField()
            if attempt.isValid {
                delegate.isValidationSucessfull()
            } else {
                validationErrors.append(attempt.error!)
                delegate.isValidationFailed(validationErrors)
            }
        }
    }
}

