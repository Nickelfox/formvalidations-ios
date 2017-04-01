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
        //var validator = StringValidator(withSelector: #selector(validationField.text?.isValidEmail), withErrorMessage: "Invalid Email")
    }
    
    @IBAction func handleResetTapped(_ sender: Any) {
        
    }
    
    func validateEmail() {
        let emailValidator = StringValidator(withSelector: #selector(validationField.text?.isValidEmail()), withErrorMessage: "Invalid Email")
        validationField.validator = emailValidator
    }

}
