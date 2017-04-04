//
//  ValidationFieldDemoViewController.m
//  NFFramework
//
//  Created by ras-fueled on 25/08/2014.
//  Copyright (c) 2014 Nickelfox. All rights reserved.
//

#import "ValidationFieldDemoViewController.h"
#import "NFValidationField.h"
#import "NSString+FormValidation.h"

@interface ValidationFieldDemoViewController ()
@property (nonatomic, weak)IBOutlet NFValidationField *validationField;
@end

@implementation ValidationFieldDemoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupTextField];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)setupTextField {
  NFStringValidator *emailValidatior = [[NFStringValidator alloc] init];
  emailValidatior.validationSelector = @selector(isValidCreditCardNumber);
  emailValidatior.errorMessage = @"Invalid Email";
  self.validationField.validator = emailValidatior;
}


- (IBAction)handleValidateTapped:(id)sender {
  [self.validationField validateInputSilently];
}

- (IBAction)handleResetTapped:(id)sender {
  [self.validationField decorateForDefault];
}

@end
