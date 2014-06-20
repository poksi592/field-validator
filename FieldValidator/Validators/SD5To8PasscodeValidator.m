//
//  SD5To8PasscodeValidator.m
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "SD5To8PasscodeValidator.h"
#import "NSString+SDValidations.h"

static NSUInteger const TDMaxCodeLength = 8;
static NSUInteger const TDMinCodeLength = 5;
static NSString * const TDValidatorErrorMessage = @"Passcode not valid!";

@implementation SD5To8PasscodeValidator

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
    if(![paramString isAllDigits])
    {
        return NO;
    }
    
    if(paramString.length > TDMaxCodeLength)
    {
        return NO;
    }
    
    return YES;
}

- (BOOL)validateFullString:(NSString *)paramString
{
    //5-8 digits
    if(paramString.length > TDMaxCodeLength || paramString.length < TDMinCodeLength)
    {
        return NO;
    }
    
    //Must be all digits
    if(![paramString isAllDigits])
    {
        return NO;
    }
    return YES;
}


@end
