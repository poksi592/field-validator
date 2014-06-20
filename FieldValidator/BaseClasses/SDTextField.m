//
//  SDTextField.m
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "SDTextField.h"
#import "SDValidator.h"

@interface SDTextField ()

@property (nonatomic, copy) NSMutableArray *dependentValidatorArray;
@property (nonatomic, strong) UIColor *nonAlertTextColor;
@property (nonatomic, strong) UIFont *nonAlertFont;
@property (nonatomic, copy) NSString *nonAlertPlaceholderText;

@end

@implementation SDTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _readyToSubmit = NO;
        _nonAlertTextColor = nil;
        _nonAlertFont = nil;
        _nonAlertPlaceholderText = nil;
        _autoEndEditing = YES;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.readyToSubmit = NO;
    self.nonAlertTextColor = nil;
    self.nonAlertFont = nil;
    self.nonAlertPlaceholderText = nil;
    self.autoEndEditing = YES;
}

#pragma mark Validation

- (BOOL)validateOnEndEditing
{
    /*
     If validation is successful, then error message has to be hidden.
     This is to be implemented particularly for each TDTextField subclass
     */
    if ((self.validatorDelegate) || ([self.validatorDelegate conformsToProtocol:@protocol(SDValidatorProtocol)])) {
        
        if (![self.validatorDelegate validateFullString:self.text]) {
            
            SDValidator *validatorObject = (SDValidator*)self.validatorDelegate;
            [self setAndShowErrorMessage:validatorObject.validateEndEditingMessage];
            return NO;
        }
        else {
            
            [self hideErrorMessage];
        }
    }
    
    return YES;
}

- (BOOL)validateAsYouTypeInRange:(NSRange)range replacementString:(NSString *)string
{
    if ((self.validatorDelegate) || ([self.validatorDelegate conformsToProtocol:@protocol(SDValidatorProtocol)])) {
        
        if (self.readyToSubmit && self.isAutoEndEditing){
            [self endEditing:YES];
            return NO;
        }
        
        if (([string length] > 0) || (range.length != 1)) {
            
            NSString *newString = [self.text stringByReplacingCharactersInRange:range withString:string];
            self.readyToSubmit = [self.validatorDelegate validateFullString:newString];
            
            if ([self.validatorDelegate respondsToSelector:@selector(validateUpToString:)]){
                
                return [self.validatorDelegate validateUpToString:newString];
            }
            
            return YES;
        }
        
    }
    return YES;
}

#pragma mark error message

- (void)showErrorMessage
{
    [self.errorMessageLabel showErrorMessage];
}

- (void)hideErrorMessage
{
    [self.errorMessageLabel removeErrorMessage];
}

- (void)setAndShowErrorMessage:(NSString*)paramMessage
{
    [self.errorMessageLabel setAndShowErrorMessage:paramMessage];
}




@end
