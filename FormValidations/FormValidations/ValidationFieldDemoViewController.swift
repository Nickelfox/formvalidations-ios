//
//  ValidationFieldDemoViewController.swift
//  FormValidations
//
//  Created by Nickelfox on 03/04/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit

class ValidationFieldDemoViewController: UIViewController{
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var ccNumberTextField: UITextField!
    
    @IBOutlet var errorMessageLabel: UILabel!
    let forms = Forms()
    
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
        //forms.registerField(textField: nameTextField, validator: NameValidation())
        //forms.registerField(textField: emailTextField, validator: EmailValidation())
        //forms.registerField(textField: phoneTextField, validator: PhoneValidation())
        forms.registerField(textField: ccNumberTextField, validator: CCNumberValidation())
    }
    
    @IBAction func handleValidateTapped(_ sender: Any) {
        forms.validateAllFields(self)
    }
    
    func displayView() {
        let validateView = Bundle.main.loadNibNamed("ValidateFieldDemoView", owner: self, options: nil)?.first as! UIView
        self.view = validateView
    }
}

extension ValidationFieldDemoViewController: ValidationDelegate {
    func isValidationSucessfull() {
        removeErrors()
    }
    func isValidationFailed(_ errors: [String]) {
        for error in errors {
            errorMessageLabel.text?.append(error)
        }
        //print(errors)
    }
    
    func removeErrors() {
        errorMessageLabel.text = ""
    }
}



//class ValidationFieldDemoViewController: UIViewController {
//// TextFields
//    @IBOutlet var nameTextField: ValidationField!
//    @IBOutlet var emailTextField: ValidationField!
//    @IBOutlet var phoneTextField: ValidationField!
//    
//// ErrorMessage Label
//    @IBOutlet var errorMessageLabel: UILabel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupTextField()
//    }
//    
//    func setupTextField() {
//        displayView()
//        nameTextField.validator = NameValidation()
//        emailTextField.validator = EmailValidation()
//        phoneTextField.validator = PhoneValidation()
//    }
//    
//    @IBAction func didEndEditing(_ sender: Any) {
//        nameTextField.validateInputSilently()
//        errorMessageLabel.text = nameTextField.error
//    }
//    
//    @IBAction func handleValidateTapped(_ sender: Any) {
//    }
//    
//    @IBAction func handleResetTapped(_ sender: Any) {
//        reset()
//    }
//    
//    func reset() {
//        nameTextField.text = ""; emailTextField.decorate(nil)
//        emailTextField.text = ""; emailTextField.decorate(nil)
//        phoneTextField.text = ""; phoneTextField.decorate(nil)
//    }
//    
//    func displayView() {
//        let validateView = Bundle.main.loadNibNamed("ValidateFieldDemoView", owner: self, options: nil)?.first as! UIView
//        self.view = validateView
//    }
//}

