//
//  NFStringValidator.h
//  NFFramework
//
//  Created by ras-fueled on 24/08/2014.
//  Copyright (c) 2014 Nickelfox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NFStringValidator : NSObject

+ (instancetype)stringValidatorWithSelector:(SEL)validationSelector withErrorMessage:(NSString *)errorMessage;
- (id)initWithSelector:(SEL)validationSelector withErrorMessage:(NSString *)errorMessage;

@property (nonatomic, assign)SEL validationSelector;
@property (nonatomic, copy)NSString *errorMessage;

- (BOOL)validateString:(NSString *)string withErrorMessage:(NSString **)errorMessage;
@end
