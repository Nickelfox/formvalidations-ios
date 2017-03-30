//
//  NSString+FormValidation.h
//  NFFramework
//
//  Created by ras-fueled on 24/08/2014.
//  Copyright (c) 2014 Nickelfox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FormValidation)
/**
 Returns YES if the string is not empty, otherwise returns NO.
 @return A BOOL describing whether or not the string is not empty.
 */
- (BOOL)isNonempty;
/**
 Returns YES if the string is made up of alphabetic characters (a-z, A-Z), otherwise NO.
 @return A BOOL describing whether or not the string is alphabetic.
 */
- (BOOL)isAlphabetic;
/**
 Returns YES if the string is made up of number characters (0-9), otherwise NO.
 @return A BOOL describing whether or not the string is numeric.
 */
- (BOOL)isNumeric;
/**
 Returns YES if the string is made up of alphanumeric characters (a-z, A-Z, 0-9), otherwise NO.
 @return A BOOL describing whether or not the string is alphanumeric.
 */
- (BOOL)isAlphanumeric;
/**
 Returns YES if the string is a valid email address, otherwise NO.
 @return A BOOL describing whether or not the string is a valid email address.
 */
- (BOOL)isValidEmail;
/**
 Returns YES if the string is a valid URL, otherwise NO.
 @return A BOOL describing whether or not the string is a valid URL.
 */
- (BOOL)isValidURL;
/**
 Returns YES if the string is a valid password (6 or more characters), otherwise NO.
 @return A BOOL describing whether or not the string is a valid password.
 */
- (BOOL)isValidPassword;
/**
 *  Returns YES if the expiration date is valid. The given date string is tested against the current date, and returns NO if it's in the past.
 *  The method expect the format MM/yy or MM/yyyy.
 *  @return A BOOL describing whether or not the string is a valid expiration date.
 */
- (BOOL)isValidCreditCardExpirationDate;
/**
 *  Returns YES if the string is a valid credit card number.
 *  @discussion Uses luhn algorithm to validate the credit card number.
 *  @example The credit card number 4111 1111 1111 1111 can be used for test purpose.
 *  @return A BOOL describing whether or not the string is a valid credit card number.
 */
- (BOOL)isValidCreditCardNumber;
/**
 *  Returns YES if the string is a valid card verification code (Between 3 and 4 digits).
 *  @return A BOOL describing whether or not the string is a valid card verification code.
 */
- (BOOL)isValidCardVerificationCode;

@end
