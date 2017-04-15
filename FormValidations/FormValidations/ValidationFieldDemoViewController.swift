//
//  ValidationFieldDemoViewController.swift
//  FormValidations
//
//  Created by Nickelfox on 03/04/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit

class ValidationFieldDemoViewController: UIViewController {
// TextFields
    @IBOutlet var nameTextField: ValidationField!
    @IBOutlet var emailTextField: ValidationField!
    @IBOutlet var phoneTextField: ValidationField!
    
// ErrorMessage Label
    @IBOutlet var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    
    func setupTextField() {
        displayView()
        nameTextField.validator = NameValidation()
        emailTextField.validator = EmailValidation()
        phoneTextField.validator = PhoneValidation()
    }
    
    @IBAction func didEndEditing(_ sender: Any) {
        nameTextField.validateInputSilently()
        errorMessageLabel.text = nameTextField.error
    }
    
    @IBAction func handleValidateTapped(_ sender: Any) {
    }
    
    @IBAction func handleResetTapped(_ sender: Any) {
        reset()
    }
    
    func reset() {
        nameTextField.text = ""; emailTextField.decorateForDefault()
        emailTextField.text = ""; emailTextField.decorateForDefault()
        phoneTextField.text = ""; phoneTextField.decorateForDefault()
    }
    
    func displayView() {
        let validateView = Bundle.main.loadNibNamed("ValidateFieldDemoView", owner: self, options: nil)?.first as! UIView
        self.view = validateView
    }
}

