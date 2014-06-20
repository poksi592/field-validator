//
//  SDErrorLabel.m
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "SDErrorLabel.h"

@implementation SDErrorLabel

- (void)showErrorMessage
{
    self.text = self.errorMessage;
}

- (void)removeErrorMessage
{
    self.text = nil;
}

- (void)setAndShowErrorMessage:(NSString*)paramMessage
{
    self.errorMessage = paramMessage;
    [self showErrorMessage];
}

@end
