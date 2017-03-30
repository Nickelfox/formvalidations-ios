//
//  SignupViewController.m
//  NFFramework
//
//  Created by ras-fueled on 26/08/2014.
//  Copyright (c) 2014 Nickelfox. All rights reserved.
//

#import "SignupViewController.h"
#import "NFValidationField.h"
#import "NSString+FormValidation.h"

#define kbHeight 216.0f

@interface SignupViewController ()
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet NFValidationField *firstNameField;
@property (nonatomic, weak) IBOutlet NFValidationField *lastNameField;
@property (nonatomic, weak) IBOutlet NFValidationField *emailField;
@property (nonatomic, weak) IBOutlet NFValidationField *passwordField;
@property (nonatomic, weak) IBOutlet NFValidationField *confirmPasswordField;
@end

@implementation SignupViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    [self initialize];
  }
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self initialize];
  }
  return self;
}

- (void)initialize {
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(handleKbWillShow:)
                                               name:UIKeyboardWillShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(handleKbWillHide:)
                                               name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupForm];
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  [self setupScrollView];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)setupScrollView {
  self.scrollView.contentSize = self.scrollView.frame.size;
  UITapGestureRecognizer *tapGesture =
  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapOnScrollView:)];
  tapGesture.numberOfTapsRequired = 1;
  tapGesture.numberOfTouchesRequired = 1;
  [self.scrollView addGestureRecognizer:tapGesture];
}


- (void)setupForm {
  self.firstNameField.validator =
  [NFStringValidator stringValidatorWithSelector:@selector(isNonempty) 
                                withErrorMessage:NSLocalizedString(@"InvalidFirstName", nil)];
  self.lastNameField.validator =
  [NFStringValidator stringValidatorWithSelector:@selector(isNonempty)
                                withErrorMessage:NSLocalizedString(@"InvalidLastName", nil)];
  self.emailField.validator =
  [NFStringValidator stringValidatorWithSelector:@selector(isValidEmail)
                                withErrorMessage:NSLocalizedString(@"InvalidEmail", nil)];
  self.passwordField.validator =
  [NFStringValidator stringValidatorWithSelector:@selector(isValidPassword)
                                withErrorMessage:NSLocalizedString(@"InvalidPassword", nil)];
  self.confirmPasswordField.validator =
  [NFStringValidator stringValidatorWithSelector:@selector(isValidPassword)
                                withErrorMessage:NSLocalizedString(@"InvalidPassword", nil)];

}

#pragma mark - Action Handlers
- (IBAction)handleSignupTapped:(id)sender {
  if ([self validateForm]) {
    NSLog(@"Go for Signup");
  }
}

- (void)handleTapOnScrollView:(UITapGestureRecognizer *)gesture {
  [self.view resignFirstResponder];
}


#pragma mark - Form Validation
- (BOOL)validateForm {
  BOOL isFirstNameValid = [self.firstNameField validateInputSilently];
  BOOL isLastNameValid = [self.lastNameField validateInputSilently];
  BOOL isEmailValid = [self.emailField validateInputSilently];
  BOOL isPasswordValid = [self.passwordField validateInputSilently];
  BOOL isConfirmPasswordValid = [self.confirmPasswordField validateInputSilently];
  BOOL passwordsMatch = [self.passwordField.text isEqualToString:self.confirmPasswordField.text];
  if (!passwordsMatch) {
    [self.passwordField decorateForInvalidInput];
    [self.confirmPasswordField decorateForInvalidInput];
  }
  return
  isFirstNameValid && isLastNameValid &&
  isEmailValid && isPasswordValid && isConfirmPasswordValid && passwordsMatch;
}

#pragma mark - Keyboard
- (void)handleKbWillShow:(NSNotification *)notification {
  if (self.view.window) {
    CGRect rect = self.scrollView.frame;
    rect.size.height -= kbHeight;
    self.scrollView.frame = rect;
  }
}

- (void)handleKbWillHide:(NSNotification *)notification {
  if (self.view.window) {
    CGRect rect = self.scrollView.frame;
    rect.size.height += kbHeight;
    self.scrollView.frame = rect;
  }
}
@end
