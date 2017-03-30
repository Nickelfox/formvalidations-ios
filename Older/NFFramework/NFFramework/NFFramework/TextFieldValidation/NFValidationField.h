//
//  NFValidationField.h
//  NFFramework
//
//  Created by ras-fueled on 24/08/2014.
//  Copyright (c) 2014 Nickelfox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NFStringValidator.h"

@interface NFValidationField : UITextField
@property (nonatomic, strong) NFStringValidator *validator;

- (BOOL)validateInputSilently;

- (BOOL)validateInputWithError:(NSString **)errorMessage;

- (void)decorateForValidInput;

- (void)decorateForInvalidInput;

- (void)decorateForDefault;

@end
