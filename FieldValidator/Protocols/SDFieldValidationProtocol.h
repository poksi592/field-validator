//
//  SDFieldValidationProtocol.h
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//


/**
 Protocol to implement methods for validation in SDTextField and eventual subclasses
 */
@protocol SDFieldValidationProtocol <NSObject,UITextFieldDelegate>

/**
 This method overrides standard UITextFieldDelegate method
 
 @param range NSRange value for the string parameter
 @param string NSString that was receiven in UITextFIeld
 */
@optional
-(BOOL)validateAsYouTypeInRange:(NSRange)range replacementString:(NSString *)string;

/**
 This method peforms validity check upon end editing UITextField event.
 */
@required
-(BOOL)validateOnEndEditing;

@end
