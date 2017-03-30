//
//  ForgotPwdViewController.m
//  NFFramework
//
//  Created by ras-fueled on 26/08/2014.
//  Copyright (c) 2014 Nickelfox. All rights reserved.
//

#import "ForgotPwdViewController.h"
#import "NFValidationField.h"
#import "NSString+FormValidation.h"

@interface ForgotPwdViewController ()
@property(nonatomic, weak) IBOutlet NFValidationField *emailField;
@end

@implementation ForgotPwdViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupForm];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)setupForm {
  self.emailField.validator =
  [NFStringValidator stringValidatorWithSelector:@selector(isValidEmail)
                                withErrorMessage:NSLocalizedString(@"InvalidEmail", nil)];
}

#pragma mark - Action Handlers
- (IBAction)handleDoneTapped:(id)sender {
  if ([self validateForm]) {
    NSLog(@"Send reset pwd link to email");
  }
}

#pragma mark - Form Validation
- (BOOL)validateForm {
 return [self.emailField validateInputSilently];
}

@end
