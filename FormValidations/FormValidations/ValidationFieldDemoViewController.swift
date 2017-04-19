//
//  ValidationFieldDemoViewController.swift
//  FormValidations
//
//  Created by Nickelfox on 03/04/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit

class ValidationFieldDemoViewController: UIViewController{
    @IBOutlet var nameTextField: ValidationField!
    @IBOutlet var emailTextField: ValidationField!
    @IBOutlet var phoneTextField: ValidationField!
    @IBOutlet var ccNumberTextField: ValidationField!
    @IBOutlet var pinCodeTextField: ValidationField!

    
    @IBOutlet var errorMessageLabel: UILabel!
    
    let form = Form()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning")
    }
    
    func setupTextFields() {
        displayView()
        nameTextField.validator = NameValidator()
        emailTextField.validator = EmailValidator()
        phoneTextField.validator = PhoneValidator()
        ccNumberTextField.validator = CCNumberValidator()
        pinCodeTextField.validator = PinCodeValidator()
        
        form.inputs = [nameTextField, emailTextField, phoneTextField, ccNumberTextField, pinCodeTextField]
    }
    @IBAction func handleTextFieldDidEndEditing(_ sender: Any) {
        
    }
    
    @IBAction func handleValidateTapped(_ sender: Any) {
        let (isValid, errors) = self.form.validate()
        if !isValid {
            for error in errors.reversed() {
                errorMessageLabel.text = error
            }
        }
        print("isValid: \(isValid)")
        print("errors: \(errors)")
    }
    
    func displayView() {
        let validateView = Bundle.main.loadNibNamed("ValidateFieldDemoView", owner: self, options: nil)?.first as! UIView
        self.view = validateView
    }
}

