//
//  ValidationRule.swift
//  FormValidations
//
//  Created by Vaibhav Parmar on 17/04/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

class ValidationRule {
    let textField: UITextField
    var rule: ValidationProtocol
    
    init(textField: UITextField, rule: ValidationProtocol) {
        self.textField = textField
        self.rule = rule
    }
    
    func validateField() -> (Bool, String?) {
        guard let text = textField.text else { return (false, nil) }
        return rule.validate(text)
        
    }
    
}
