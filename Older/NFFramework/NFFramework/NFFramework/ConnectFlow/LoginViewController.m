//
//  LoginViewController.m
//  NFFramework
//
//  Created by ras-fueled on 25/08/2014.
//  Copyright (c) 2014 Nickelfox. All rights reserved.
//

#import "LoginViewController.h"
#import "NFValidationField.h"
#import "NSString+FormValidation.h"

#define kbHeight 216.0f

@interface LoginViewController ()
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet NFValidationField *usernameField;
@property (nonatomic, weak) IBOutlet NFValidationField *passwordField;
@end

@implementation LoginViewController

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

- (void)initialize {
  [[NSNotificationCenter defaultCenter] addObserver:self 
                                           selector:@selector(handleKbWillShow:)
                                               name:UIKeyboardWillShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(handleKbWillHide:)
                                               name:UIKeyboardWillHideNotification object:nil];
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
  self.usernameField.validator =
  [NFStringValidator stringValidatorWithSelector:@selector(isValidEmail) withErrorMessage:NSLocalizedString(@"InvalidEmail", nil)];
  self.passwordField.validator =
  [NFStringValidator stringValidatorWithSelector:@selector(isValidPassword) withErrorMessage:NSLocalizedString(@"InvalidPassword", nil)];
}


#pragma mark - Action Handlers
- (IBAction)handleLoginTapped:(id)sender {
  // Login Call
  if ([self validateForm]) {
    NSLog(@"Go For Login");
  }
}

- (IBAction)handleFBConnectTapped:(id)sender {
  //login with FB flow
}


- (void)handleTapOnScrollView:(UITapGestureRecognizer *)gesture {
  [self.usernameField resignFirstResponder];
  [self.passwordField resignFirstResponder];
}

#pragma mark - Form Validation
- (BOOL)validateForm {
  BOOL isEmailValid = [self.usernameField validateInputSilently];
  BOOL isPwdValid = [self.passwordField validateInputSilently];
  
  BOOL isFormValid = isEmailValid && isPwdValid;
  return isFormValid;
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
