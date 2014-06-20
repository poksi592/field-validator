//
//  SDValidatorProtocol.h
//  FieldValidator
//
//  Created by Mladen Despotovic on 19/06/2014.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//


/**
 This protocol defines 2 general validating methods for now.
 
 Validation methods can be implemented on particular subclass of UITextField, UILabel,
 UIButton, etc... however, we might find it not reall appropriate sometimes.
 
 That's why we can create actual validator classes to be applied as validatorDelegate
 property to SD base classes, like SDTextField.
 Don;t forget to retain it inside view controlelr, because it is a weak property.
 */

@protocol SDValidatorProtocol <NSObject>

@optional
- (BOOL)validateUpToString:(NSString*)paramString;
@required
- (BOOL)validateFullString:(NSString*)paramString;

@end
