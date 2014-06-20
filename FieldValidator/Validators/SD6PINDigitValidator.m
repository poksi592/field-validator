//
//  SD6PINDigitValidator.m
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "SD6PINDigitValidator.h"
#import "NSString+SDValidations.h"

@implementation SD6PINDigitValidator

static NSUInteger const TDMaxCodeLength = 6;
static NSString * const SDTextField6DigitRegex = @"^[0-9]{6}$";
static NSString * const TDValidatorErrorMessage = @"PIN not valid!";

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.validateEndEditingMessage = TDValidatorErrorMessage;
    }
    return self;
}

- (BOOL)validateUpToString:(NSString *)paramString
{
    return [paramString isAllDigitsAndNoLongerThan:TDMaxCodeLength];
}

- (BOOL)validateFullString:(NSString *)paramString
{
    return (([paramString isMatchingRegexPattern:SDTextField6DigitRegex]) ? YES : NO);
}

@end
