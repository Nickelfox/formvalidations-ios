//
//  ValidationFieldDemoView.swift
//  FormValidations
//
//  Created by Nickelfox on 30/03/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit

class ValidationFieldDemoView: UIView {

    @IBOutlet var validationField: ValidationField!

    @IBAction func handleValidateTapped(_ sender: Any) {
        validateEmail()
    }
    
    @IBAction func handleResetTapped(_ sender: Any) {
        
    }
    
    func validateEmail() {
        if let text = validationField.text {
            let text1 = NSString.init(string: text)
            let x  = #selector(text1.isNumeric)
            let emailValidator = StringValidator(withSelector: x, withErrorMessage: "Invalid Email")
            validationField.validator = emailValidator
            let _ = validationField.validateInputSilently()
        }
    }

}
