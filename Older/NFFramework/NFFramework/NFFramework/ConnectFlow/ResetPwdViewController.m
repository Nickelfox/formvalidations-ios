//
//  ResetPwdViewController.m
//  NFFramework
//
//  Created by ras-fueled on 26/08/2014.
//  Copyright (c) 2014 Nickelfox. All rights reserved.
//

#import "ResetPwdViewController.h"
#import "NFValidationField.h"
#import "NSString+FormValidation.h"

@interface ResetPwdViewController ()
@property(nonatomic, weak)IBOutlet NFValidationField *passwordField;
@property(nonatomic, weak)IBOutlet NFValidationField *confirmPasswordField;
@end

@implementation ResetPwdViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupForm];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)setupForm {
  self.passwordField.validator = [NFStringValidator stringValidatorWithSelector:@selector(isValidPassword) withErrorMessage:NSLocalizedString(@"InvalidPassword", nil)];
  self.confirmPasswordField.validator = [NFStringValidator stringValidatorWithSelector:@selector(isValidPassword) withErrorMessage:NSLocalizedString(@"InvalidPassword", nil)];
}


#pragma mark - Done Tapped
- (IBAction)handleDoneTapped:(id)sender {
  if ([self validateForm]) {
    NSLog(@"Reset Pwd");
  }
}


#pragma mark - Form Validation
- (BOOL)validateForm {
  BOOL isPwdValid = [self.passwordField validateInputSilently];
  BOOL isConfirmPwdValid = [self.confirmPasswordField validateInputSilently];
  BOOL passwordsMatch = [self.passwordField.text isEqualToString:self.confirmPasswordField.text];
  if (!passwordsMatch) {
    [self.passwordField decorateForInvalidInput];
    [self.confirmPasswordField decorateForInvalidInput];
  }
  return isPwdValid && isConfirmPwdValid && passwordsMatch;
}

@end
