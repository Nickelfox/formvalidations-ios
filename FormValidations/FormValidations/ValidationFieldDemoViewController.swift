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
        
        form.inputs = [nameTextField, emailTextField, phoneTextField]
    }
    @IBAction func handleTextFieldDidEndEditing(_ sender: Any) {
        let (isValid, errors) = self.form.validate()
        print("isValid: \(isValid)")
        print("errors: \(errors)")
    }
    
    @IBAction func handleValidateTapped(_ sender: Any) {
        
    }
    
    func displayView() {
        let validateView = Bundle.main.loadNibNamed("ValidateFieldDemoView", owner: self, options: nil)?.first as! UIView
        self.view = validateView
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

