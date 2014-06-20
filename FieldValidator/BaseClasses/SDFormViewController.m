//
//  SDFormViewController.m
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "SDFormViewController.h"
#import "SDFieldValidationProtocol.h"
#import "SDTextField.h"

@implementation SDFormViewController


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([textField respondsToSelector:@selector(validateAsYouTypeInRange:replacementString:)]) {
        return [(id<SDFieldValidationProtocol>)textField validateAsYouTypeInRange:range replacementString:string];
    }
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField respondsToSelector:@selector(validateOnEndEditing)]) {
        if ([(id<SDFieldValidationProtocol>)textField validateOnEndEditing]) {
            [(SDTextField*)textField hideErrorMessage];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma UITextField Delegate methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField isKindOfClass:[SDTextField class]]) {
        
        SDTextField *castedTDTextField = (SDTextField*)textField;
        [castedTDTextField hideErrorMessage];
        castedTDTextField.readyToSubmit = NO;
    }
}


@end
