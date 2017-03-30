//
//  NFStringValidator.m
//  NFFramework
//
//  Created by ras-fueled on 24/08/2014.
//  Copyright (c) 2014 Nickelfox. All rights reserved.
//

#import "NFStringValidator.h"

@implementation NFStringValidator

+ (instancetype)stringValidatorWithSelector:(SEL)validationSelector withErrorMessage:(NSString *)errorMessage {
  return [[NFStringValidator alloc] initWithSelector:validationSelector withErrorMessage:errorMessage];
}

- (id)initWithSelector:(SEL)validationSelector withErrorMessage:(NSString *)errorMessage {
  if (self = [super init]) {
    _validationSelector = validationSelector;
    _errorMessage = errorMessage;
  }
  return self;
}

- (id)init {
  return [self initWithSelector:nil withErrorMessage:nil];
}

- (BOOL)validateString:(NSString *)string withErrorMessage:(NSString **)errorMessage {
  BOOL isInputValid;
  if (self.validationSelector) {
    BOOL validSelector = [string respondsToSelector:self.validationSelector];
    if (validSelector) {
      NSMethodSignature *methodSignature =
      [[string class] instanceMethodSignatureForSelector:self.validationSelector];
      NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
      [invocation setSelector:self.validationSelector];
      [invocation setTarget:self];
      [invocation setArgument:&string atIndex:0];
      [invocation invoke];
      [invocation getReturnValue:&isInputValid];
      if (!isInputValid) {
        if (self.errorMessage) {
          *errorMessage = self.errorMessage;
        }
        else {
          *errorMessage = NSLocalizedString(@"Invalid Input", nil);
        }
      }
    }
    else {
      *errorMessage = NSLocalizedString(@"Invalid validation selector.", nil);
    }
  }
  else {
    *errorMessage = NSLocalizedString(@"No validation selector set", nil);
  }
  return isInputValid;
}
@end
