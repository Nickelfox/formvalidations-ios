//
//  ValidationFieldDemoViewController.swift
//  FormValidations
//
//  Created by Nickelfox on 03/04/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit

class ValidationFieldDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        displayView()
    }
    
    func displayView() {
        let validateView = Bundle.main.loadNibNamed("ValidateFieldDemoView", owner: self, options: nil)?.first as! ValidationFieldDemoView
        self.view.addSubview(validateView)
        validateView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: validateView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: validateView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: validateView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: view.frame.size.width)
        let heightConstraint = NSLayoutConstraint(item: validateView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: view.frame.size.height)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
}
