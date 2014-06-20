//
//  SDErrorLabel.h
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

/**
 UILabel subclass for error messages
 
 Should be always use in conjunction with certain TDTextField, date pickers and other data input controls.
 Instance of this class should always be set as property on TDTextField.
 Actual representation of this class is an instance in IB, connected by IBOutlet
 
 This label appears as error message shown screen designs.
 */

@interface SDErrorLabel : UILabel

@property (nonatomic,copy) NSString *errorMessage;

/**
 *  ----------------------------------------------------------------------------------------
 *  @name Showing ans removing error message, previously set in view controllers as property.
 *  ----------------------------------------------------------------------------------------
 */

/**
 This method shows the error message
 
 It reads errorMessage property and assigns it to text property.
 
 @see - removeErrorMessage:
 */
- (void)showErrorMessage;

/**
 This method removes the error message
 
 It assigns nil to text property.
 
 @see - showErrorMessage:
 */
- (void)removeErrorMessage;

/**
 This method sets and shows the error message in one step
 
 @param parameMessage Error message to be displayed
 @see - showErrorMessage:
 */
- (void)setAndShowErrorMessage:(NSString*)paramMessage;

@end
