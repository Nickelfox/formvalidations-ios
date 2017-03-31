//
//  ValidationField.swift
//  FormValidations
//
//  Created by Nickelfox on 31/03/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit
import QuartzCore

class ValidationField: UITextField {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //initialize()
    }
    
    //MARK: Notification
    let UITextFieldTextDidBeginEditingNotification: NSNotification.Name
    let UITextFieldTextDidChangeNotification: NSNotification.Name
    let UITextFieldTextDidEndEditingNotification: NSNotification.Name
    
    func initialize() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleTextFieldDidBeginEditing) , name: UITextFieldTextDidBeginEditingNotification, object: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleTextFieldDidChange), name: UITextFieldTextDidChangeNotification, object: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleTextFieldDidEndEditing), name: UITextFieldTextDidEndEditingNotification, object: self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func validateInput(withError errorMessage: String) -> Bool {
        
        return false
    }
    
    //MARK: Helper Methods
    
    func handleTextFieldDidBeginEditing(notification: NSNotification) {
        
    }
    
    func handleTextFieldDidChange(notification: NSNotification) {
        
    }
    
    func handleTextFieldDidEndEditing(notification: NSNotification) {
        
    }
    
    func decorateForValidInput() {
        self.layer.borderColor = UIColor.green.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func decorateForInvalidInput() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func decorateForDefault() {
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0.0
    }
}

