//
//  Calculator.h
//  lecture
//
//  Created by Morgan Wilde on 25/04/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (nonatomic) double value;
@property (nonatomic) double buffer;
@property (nonatomic, getter = isDecimalPart) BOOL decimalPart;
@property (nonatomic, getter = inAction) BOOL inAction;
@property (nonatomic) char lastAction;

- (void)appendNumber:(double)number;
- (double)getValue;
- (NSString *)getValueString;
- (void)deleteValue;
- (void)changeSign;
- (void)makePercentage;
- (void)makeDecimal;
- (void)doAddition;
- (void)doSubtraction;
- (void)doMultiplication;
- (void)doDivision;
- (void)doResult;

@end
