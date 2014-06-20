//
//  SDTextField.h
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "SDValidatorProtocol.h"
#import "SDErrorLabel.h"
#import "SDFieldValidationProtocol.h"

/**
 Main class for all thext fields that need validation and styling
 
 SUblasses implement specific validation and styling/branding methods
 */
@interface SDTextField : UITextField <SDFieldValidationProtocol>

@property (nonatomic, weak) SDErrorLabel *errorMessageLabel;
@property (nonatomic, assign, getter = isReadyToSubmit) BOOL readyToSubmit;
@property (nonatomic, weak) id<SDValidatorProtocol> validatorDelegate;
@property (nonatomic, assign, getter = isAutoEndEditing) BOOL autoEndEditing;

/**
 *  ---------------------------------------------------------------------------------------
 *  @name Showing and hiding error message label connected to TDTextField
 *  ---------------------------------------------------------------------------------------
 */

/**
 This method is queried for the purposes of state management at all application levels
 
 @see - showErrorMessage:
 */
- (void)showErrorMessage;

/**
 This method is queried for the purposes of state management at all application levels
 
 @see - hideErrorMessage:
 */
- (void)hideErrorMessage;

/**
 This method sets and shows the error message in one step
 
 @param paramMessage Error message to be displayed
 @see - showErrorMessage:
 */
- (void)setAndShowErrorMessage:(NSString*)paramMessage;

@end
