//
//  SDValidator.h
//  FieldValidator
//
//  Created by Mladen Despotovic on 19/06/2014.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "SDValidatorProtocol.h"

@interface SDValidator : NSObject <SDValidatorProtocol>

@property (nonatomic, copy) NSString *validateEndEditingMessage;

@end
