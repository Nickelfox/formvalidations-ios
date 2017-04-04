//
//  ValidationFieldDemoViewController.swift
//  FormValidations
//
//  Created by Nickelfox on 03/04/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit

class ValidationFieldDemoViewController: UIViewController {

    @IBOutlet var textToValidate: ValidationField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayView()
        setupTextField()
    }
    
    func setupTextField() {
        var nsText: NSString
        if let text = textToValidate.text {
            nsText = text as NSString
        }
        let emailValidator = StringValidator(withSelector: #selector(nsText.isValidEmail), withErrorMessage: "Invalid Email")
        textToValidate.validator = emailValidator
    }
    
    @IBAction func handleValidateTapped(_ sender: Any) {
        let _ = textToValidate.validateInputSilently()
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
