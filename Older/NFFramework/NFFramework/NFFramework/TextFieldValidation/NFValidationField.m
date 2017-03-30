//
//  NFValidationField.m
//  NFFramework
//
//  Created by ras-fueled on 24/08/2014.
//  Copyright (c) 2014 Nickelfox. All rights reserved.
//

#import "NFValidationField.h"

@import QuartzCore;

@implementation NFValidationField

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
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
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:self];
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (BOOL)validateInputWithError:(NSString **)errorMessage {
  NSAssert(self.validator, @"Validator Can't be nil");
 return [self.validator validateString:self.text withErrorMessage:errorMessage];
}

- (BOOL)validateInputSilently {
  NSString *error;
  BOOL isValid = [self validateInputWithError:&error];
  if (isValid) {
    [self decorateForValidInput];
  }
  else {
    [self decorateForInvalidInput];
  }
  return isValid;
}


#pragma mark - 
- (void)handleTextFieldDidBeginEditing:(NSNotification *)notification {
  [self decorateForDefault];
}

- (void)handleTextFieldDidChange:(NSNotification *)notification {

}

- (void)handleTextFieldDidEndEditing:(NSNotification *)notification {
  [self validateInputSilently];  
}

- (void)decorateForValidInput {
  self.layer.borderColor = [UIColor greenColor].CGColor;
  self.layer.borderWidth = 1.0f;
}

- (void)decorateForInvalidInput {
  self.layer.borderColor = [UIColor redColor].CGColor;
  self.layer.borderWidth = 1.0f;

}

- (void)decorateForDefault {
  self.layer.borderColor = [UIColor clearColor].CGColor;
  self.layer.borderWidth = 0.0f;
}


@end
