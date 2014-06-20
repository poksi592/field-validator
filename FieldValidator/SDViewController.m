//
//  SDViewController.m
//  FieldValidator
//
//  Created by Mladen Despotovic on 19/06/2014.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "SDViewController.h"
#import "SDTextField.h"
#import "SDErrorLabel.h"
#import "SD5To8PasscodeValidator.h"
#import "SD6PINDigitValidator.h"

@interface SDViewController ()

@property (nonatomic, weak) IBOutlet SDTextField *passcodeTextField;
@property (nonatomic, weak) IBOutlet SDTextField *pinTextField;
@property (nonatomic, weak) IBOutlet SDErrorLabel *passcodeErrorLabel;
@property (nonatomic, weak) IBOutlet SDErrorLabel *pinErrorLabel;
@property (nonatomic, strong) SD6PINDigitValidator *pinValidator;
@property (nonatomic, strong) SD5To8PasscodeValidator *passcodeValidator;

@end

@implementation SDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupKeyboardNotification];
    [self setupTapRecognizer];
    [self applyValidators];

}

- (void)applyValidators
{
    self.passcodeErrorLabel.text = nil;
    self.pinErrorLabel.text = nil;
    self.passcodeTextField.errorMessageLabel = self.passcodeErrorLabel;
    self.pinTextField.errorMessageLabel = self.pinErrorLabel;
    
    self.passcodeValidator = [SD5To8PasscodeValidator new];
    self.passcodeTextField.validatorDelegate = self.passcodeValidator;
    self.passcodeTextField.autoEndEditing = NO;
    
    self.pinValidator = [SD6PINDigitValidator new],
    self.pinTextField.validatorDelegate = self.pinValidator;
}


@end
