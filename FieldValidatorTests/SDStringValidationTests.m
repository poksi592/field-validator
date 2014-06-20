//
//  SDStringValidationTests.m
//  FieldValidator
//
//  Created by Mladen Despotovic on 19. 06. 14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+SDValidations.h"

@interface SDStringValidationTests : XCTestCase

@property (nonatomic,strong) NSString *mainTestString;

@end

@implementation SDStringValidationTests

- (void)setUp
{
    [super setUp];
    self.mainTestString = nil;
}

- (void)tearDown
{
    self.mainTestString = nil;
    [super tearDown];
}

- (void)testIsAllDigitsAndRequiredLength {
    
    self.mainTestString = @"123456";
    XCTAssertTrue([self.mainTestString isAllDigitsAndRequiredLength:6], @"Should pass");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:-6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:5], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:7], @"Should fail");
    
    self.mainTestString = nil;
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:0], @"Should pass");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:-0], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:5], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:-1], @"Should fail");
    
    self.mainTestString = @"";
    XCTAssertTrue([self.mainTestString isAllDigitsAndRequiredLength:0], @"Should pass");
    XCTAssertTrue([self.mainTestString isAllDigitsAndRequiredLength:-0], @"Should pass");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:5], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:-1], @"Should fail");
    
    self.mainTestString = @"1234ab";
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:-6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:5], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:7], @"Should fail");
    
    self.mainTestString = @" 234ab";
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:-6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:5], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:7], @"Should fail");
    
    self.mainTestString = @" 23456";
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:-6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:5], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndRequiredLength:7], @"Should fail");
}

-(void) testIsAllDigitsAndNoLongerThan {
    
    self.mainTestString = @"123456";
    XCTAssertTrue([self.mainTestString isAllDigits], @"Should pass");
    
    self.mainTestString = @"123456a";
    XCTAssertFalse([self.mainTestString isAllDigits], @"Should fail");
}

- (void)testIsNumberOrLessDigits {
    
    self.mainTestString = @"123456";
    XCTAssertTrue([self.mainTestString isAllDigitsAndNoLongerThan:6], @"Should pass");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:-6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:5], @"Should pass");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:-5], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:0], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:-7], @"Should fail");
    XCTAssertTrue([self.mainTestString isAllDigitsAndNoLongerThan:7], @"Should fail");
    
    self.mainTestString = nil;
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:0], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:-7], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:7], @"Should fail");
    
    self.mainTestString = @"";
    XCTAssertTrue([self.mainTestString isAllDigitsAndNoLongerThan:0], @"Should pass");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:-7], @"Should fail");
    XCTAssertTrue([self.mainTestString isAllDigitsAndNoLongerThan:7], @"Should pass");
    
    self.mainTestString = @"1234ab";
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:-6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:5], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:7], @"Should fail");
    
    self.mainTestString = @" 234ab";
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:-6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:2], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:7], @"Should fail");
    
    self.mainTestString = @" 23456";
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:-6], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:4], @"Should fail");
    XCTAssertFalse([self.mainTestString isAllDigitsAndNoLongerThan:7], @"Should fail");
    
}


- (void)testIsMatchingRegexPattern
{
    BOOL testResult = NO;
    
    NSString *patternString = @"^/mmm/1/yipii/[^/]*$";
    
    self.mainTestString = @"abc";
    testResult = [self.mainTestString isMatchingRegexPattern:patternString];
    XCTAssertFalse(testResult, @"Should fail");
    
    self.mainTestString = @"/mmm/1/yipii/notification?applicationName=App%20name";
    testResult = [self.mainTestString isMatchingRegexPattern:patternString];
    XCTAssertTrue(testResult, @"Should pass");
    
    patternString = @"^/mmm/1/yipii/notification[^/]*$";
    self.mainTestString = @"/mrs/3/legal/notification?applicationName=App%20name";
    testResult = [self.mainTestString isMatchingRegexPattern:patternString];
    XCTAssertTrue(testResult, @"Should pass");
    
}

-(void)testIsAllAlphaNumeric
{
    NSString *testString = nil;
    
    //success cases
    testString = @"abc";
    XCTAssertTrue([testString isAllAlphanumeric], @"Should pass");
    
    testString = @"";
    XCTAssertTrue([testString isAllAlphanumeric], @"Should pass");
    
    testString = @"123";
    XCTAssertTrue([testString isAllAlphanumeric], @"Should pass");
    
    testString = @"a1b2";
    XCTAssertTrue([testString isAllAlphanumeric], @"Should pass");
    
    //failure cases
    testString = @"abc@";
    XCTAssertFalse([testString isAllAlphanumeric], @"Should fail");
    
    testString = @"@abc";
    XCTAssertFalse([testString isAllAlphanumeric], @"Should fail");
    
    testString = @"!";
    XCTAssertFalse([testString isAllAlphanumeric], @"Should fail");
    
    testString = @"!!";
    XCTAssertFalse([testString isAllAlphanumeric], @"Should fail");
    
    testString = @"a!a";
    XCTAssertFalse([testString isAllAlphanumeric], @"Should fail");
}

- (void)testisAllDigitsAndAscending
{
    NSString *testString = nil;
    
    //success cases
    testString = @"123";
    XCTAssertTrue([testString isAllDigitsAndAscending], @"Should pass.");
    
    testString = @"1";
    XCTAssertTrue([testString isAllDigitsAndAscending], @"Should pass.");
    
    testString = @"159";
    XCTAssertTrue([testString isAllDigitsAndAscending], @"Should pass.");
    
    testString = @"059";
    XCTAssertTrue([testString isAllDigitsAndAscending], @"Should pass.");
    
    testString = @"0";
    XCTAssertTrue([testString isAllDigitsAndAscending], @"Should pass.");
    
    testString = @"123455";
    XCTAssertTrue([testString isAllDigitsAndAscending], @"Should pass.");
    
    testString = @"222";
    XCTAssertTrue([testString isAllDigitsAndAscending], @"Should pass.");
    
    //failure cases
    testString  = @"abc";
    XCTAssertFalse([testString isAllDigitsAndAscending], @"Should fail.");
    
    testString = @"1231";
    XCTAssertFalse([testString isAllDigitsAndAscending], @"Should fail.");
    
    testString = @"321";
    XCTAssertFalse([testString isAllDigitsAndAscending], @"Should fail.");
}

- (void)testisAllDigitsAndDescending
{
    NSString *testString = nil;
    
    //success cases
    testString = @"4321";
    XCTAssertTrue([testString isAllDigitsAndDescending], @"Should pass.");
    
    testString = @"0";
    XCTAssertTrue([testString isAllDigitsAndDescending], @"Should pass.");
    
    testString = @"980";
    XCTAssertTrue([testString isAllDigitsAndDescending], @"Should pass.");
    
    testString  = @"111";
    XCTAssertTrue([testString isAllDigitsAndDescending], @"Should pass.");
    
    testString  = @"211";
    XCTAssertTrue([testString isAllDigitsAndDescending], @"Should pass.");
    
    //failure cases
    testString  = @"abc";
    XCTAssertFalse([testString isAllDigitsAndDescending], @"Should fail.");
    
    testString  = @"989";
    XCTAssertFalse([testString isAllDigitsAndDescending], @"Should fail.");
}


@end
