//
//  ValidationFieldDemoViewController.swift
//  FormValidations
//
//  Created by Nickelfox on 03/04/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit

protocol ValidationDelegate: class {
    func validateString(withMethod method: String, withErrorMessage: String)
}

class ValidationFieldDemoViewController: UIViewController {
    
    @IBOutlet var textToValidate: ValidationField!
    weak var validateStringDelegate: ValidationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    
    func setupTextField() {
        displayView()
        self.validateStringDelegate = self.textToValidate
        self.validateStringDelegate?.validateString(withMethod: "isValidCreditCardNumber", withErrorMessage: "Invalid Email")
    }
    
    @IBAction func handleValidateTapped(_ sender: Any) {
        textToValidate.validateInputSilently()
    }
    
    @IBAction func handleResetTapped(_ sender: Any) {
        textToValidate.text = ""
        textToValidate.decorateForDefault()
    }
    
    func displayView() {
        let validateView = Bundle.main.loadNibNamed("ValidateFieldDemoView", owner: self, options: nil)?.first as! UIView
        self.view = validateView
    }
}
