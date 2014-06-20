//
//  SDBaseViewController.h
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "SDKeyboardScrollProtocol.h"

/**
 This class is intended to be used as base class for all other View Controller subclasses
 
 **/

@interface SDBaseViewController : UIViewController <SDKeyboardScrollProtocol>

@property (nonatomic,weak) IBOutlet UIScrollView *layoutScrollView;
@property (nonatomic,strong) UIView *activeView;

@end
