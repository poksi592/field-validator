//
//  SDBaseViewController.m
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "SDBaseViewController.h"


static const CGFloat TDScrolledViewActiveFieldToKeyboardOffset = 20.0f;
static NSTimeInterval TDTDScrolledViewControllerBackAnimationTime = 0.3l;


@interface SDBaseViewController ()

@property (nonatomic) CGPoint originalContentOffset;
@property (nonatomic, assign) UIEdgeInsets originalContentInset;

@end


@implementation SDBaseViewController


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self.layoutScrollView setTranslatesAutoresizingMaskIntoConstraints:YES];
}

#pragma mark Implementing TDKeyboardScrollProtocol for Keyboard Showing

- (void)setupKeyboardNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}


- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGRect keyboardRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    
    keyboardRect.size.height += TDScrolledViewActiveFieldToKeyboardOffset;
    
    self.originalContentInset = self.layoutScrollView.contentInset;
    self.originalContentOffset = self.layoutScrollView.contentOffset;
    
    UIEdgeInsets contentInset = self.layoutScrollView.contentInset;
    contentInset.bottom = keyboardRect.size.height;
    self.layoutScrollView.contentInset = contentInset;
}

- (void)keyboardWillHide:(NSNotification *)notification {
    
    [self.layoutScrollView setContentInset:self.originalContentInset];
    [UIView animateWithDuration:TDTDScrolledViewControllerBackAnimationTime animations:^{
        self.layoutScrollView.contentOffset = self.originalContentOffset;
    }];
}

- (void)setupTapRecognizer
{
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [tapRecognizer setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tapRecognizer];
}

- (IBAction)handleTapGesture:(UITapGestureRecognizer *)gesture {
    
    [self.view endEditing:YES];
}


#pragma mark Implementing UITextField Delegate to define visible field

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    self.activeView = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    self.activeView = nil;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
