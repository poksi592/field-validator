//
//  SDKeyboardScrollProtocol.h
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//


@protocol SDKeyboardScrollProtocol <NSObject,UITextFieldDelegate>

// Protocol defines methods that handle scrolling layout view, based on keyboard appearance
// and visibility of curently edited field

@required

// implementing method to init notification observer on view controller to be able
// to respond to keyboars show and hide
- (void)setupKeyboardNotification;

// Respond to UIKeyboardWillShowNotification event, so we can scroll the view to show
// active field
- (void)keyboardWillShow:(NSNotification *)notification;

// Respond to UIKeyboardWillHideNotification event, so we can scroll layout view
// back to initial position
- (void)keyboardWillHide:(NSNotification *)notification;

// UITextFieldDelegates have to be implemented to define active field to which the view is to
// be scrolled to. They may be overriden for other purposes as well
- (void)textFieldDidBeginEditing:(UITextField *)textField;
- (void)textFieldDidEndEditing:(UITextField *)textField;

// Methods to init and handle Tap Gesture on view to initiate keyborad withdrawal
- (void)setupTapRecognizer;
- (IBAction)handleTapGesture:(UITapGestureRecognizer *)gesture;

@end
