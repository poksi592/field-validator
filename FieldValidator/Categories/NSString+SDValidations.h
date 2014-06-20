//
//  NSString+SDValidations.h
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//


@interface NSString (SDValidations)

/**
 This method check if the string contains all digits
 
 */
- (BOOL)isAllDigits;


/**
 This method check if the string contains exactly the number of digits
 
 @param paramNumberOfDigits number of digits to be valudated upon
 */
- (BOOL)isAllDigitsAndRequiredLength:(NSInteger)paramRequiredLength;

/**
 This method check if the string contains number of digits or less
 
 @param paramNumberOfDigits number of digits to be valudated upon
 */
- (BOOL)isAllDigitsAndNoLongerThan:(NSInteger)paramMaximumLength;

/**
 Method checks if string matches the regex string pattern parameter passed
 
 @param paramRegexPattern Regex string pattern parameter passed
 @return YES if string matches the pattern, otherwise NO
 */
- (BOOL)isMatchingRegexPattern:(NSString*)paramRegexPattern;

/**
 This method checks if the string is made up only of letters
 @return returns YES if made up only of letters
 */
- (BOOL)isAllCharacters;

/**
 This method check if the string contains exactly the letters of digits
 
 @param paramRequiredLength number of letters to be valudated upon
 @return return YES if the string is correspnding length and made up only of letters
 */
- (BOOL)isAllCharactersAndRequiredLength:(NSInteger)paramRequiredLength;

/**
 This method check if the string contains number of letters or less
 
 @param paramMaximumLength number of letters to be valudated upon
 @return return YES if the string is correspnding length or less and made up only of letters
 */
- (BOOL)isAllCharactersAndNoLongerThan:(NSInteger)paramMaximumLength;

/**
 This method checks if the string is made up only of alphanumeric characters.
 @return Returns YES if made up only of letters.
 */
- (BOOL)isAllAlphanumeric;


/**
 Checks if it is all digits and digits are ascending.
 @return BOOL
 */
- (BOOL)isAllDigitsAndAscending;

/**
 Checks if it is all digits and digits are descending.
 @return BOOL
 */
- (BOOL)isAllDigitsAndDescending;



@end
