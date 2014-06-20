//
//  NSString+SDValidations.m
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "NSString+SDValidations.h"

@implementation NSString (SDValidations)

- (BOOL)isAllDigits
{
    NSCharacterSet* nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange r = [self rangeOfCharacterFromSet: nonNumbers];
    return (r.location == NSNotFound);
}

- (BOOL)isAllCharacters
{
    NSCharacterSet* nonLetters = [[NSCharacterSet letterCharacterSet] invertedSet];
    NSRange r = [self rangeOfCharacterFromSet: nonLetters];
    BOOL result =  (r.location == NSNotFound);
    return result;
}

- (BOOL)isAllAlphanumeric
{
    NSCharacterSet* nonLetters = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    NSRange r = [self rangeOfCharacterFromSet: nonLetters];
    BOOL result =  (r.location == NSNotFound);
    return result;
}


- (BOOL)isAllDigitsAndRequiredLength:(NSInteger)paramRequiredLength
{
    
    if (paramRequiredLength < 0) {
        return NO;
    }
    BOOL isLength = ((NSUInteger)paramRequiredLength == [self length]);
    
    return (isLength && ([self isAllDigits]));
}

- (BOOL)isAllDigitsAndNoLongerThan:(NSInteger)paramMaximumLength
{
    
    if (paramMaximumLength < 0) {
        return NO;
    }
    BOOL isLength = ([self length] <= (NSUInteger)paramMaximumLength);
    
    return (isLength && [self isAllDigits]);
}

- (BOOL)isAllCharactersAndRequiredLength:(NSInteger)paramRequiredLength
{
    
    if (paramRequiredLength < 0) {
        return NO;
    }
    BOOL isLength = ((NSUInteger)paramRequiredLength == [self length]);
    
    return (isLength && ([self isAllCharacters]));
}

- (BOOL)isAllCharactersAndNoLongerThan:(NSInteger)paramMaximumLength
{
    
    if (paramMaximumLength < 0) {
        return NO;
    }
    BOOL isLength = ([self length] <= (NSUInteger)paramMaximumLength);
    
    return (isLength && [self isAllCharacters]);
}

- (BOOL)isAllAlphanumericAndNoLongerThan:(NSInteger)paramMaximumLength
{
    if(paramMaximumLength < 0)
    {
        return NO;
    }
    BOOL isLength = ([self length] <= (NSUInteger)paramMaximumLength);
    
    return (isLength && [self isAllAlphanumeric]);
}


- (BOOL)isMatchingRegexPattern:(NSString*)paramRegexPattern
{
    NSError *expressionError = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:paramRegexPattern options:0 error:&expressionError];
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:self
                                                        options:0
                                                          range:NSMakeRange(0, [self length])];
    
    return (numberOfMatches == 0 ? NO : YES);
}

- (BOOL)hasAlphanumericCharacters
{
    NSCharacterSet *alphanumericSet = [NSCharacterSet alphanumericCharacterSet];
    if ([[self stringByTrimmingCharactersInSet:alphanumericSet] length] == 0) {
        return YES;
    }
    return NO;
}


- (BOOL)isAllDigitsAndAscending
{
    if(![self isAllDigits])
    {
        return NO;
    }
    
    for(NSInteger characterIndex = 0; characterIndex < self.length - 1; characterIndex++)
    {
        if([self characterAtIndex:(characterIndex)] >
           [self characterAtIndex:(characterIndex+1)])
        {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)isAllDigitsAndDescending
{
    if(![self isAllDigits])
    {
        return NO;
    }
    
    for(NSInteger characterIndex = 0; characterIndex < self.length - 1; characterIndex++)
    {
        if([self characterAtIndex:(characterIndex)] <
           [self characterAtIndex:(characterIndex+1)])
        {
            return NO;
        }
    }
    
    return YES;
}


@end
