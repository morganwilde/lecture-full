//
//  Calculator.m
//  Calculator
//
//  Created by Aivaras Saulius on 4/25/14.
//  Copyright (c) 2014 Aivaras Saulius. All rights reserved.
//

#import "Calculator.h"
#import <math.h>

@interface Calculator()
@property (nonatomic) int lastPow;
@end

@implementation Calculator : NSObject

- (id)init {
    self = [super init];
    if (self != nil) {
        self.lastPow = 0;
        self.lastAction = 5;
        self.decimalPart = NO;
        self.buffer =  0;
        self.value = 0;
        self.inAction = NO;
    }
    return self;
}

- (void)appendNumber:(double)number {
    if (! self.isDecimalPart) {
        self.value *= 10;
        if (self.value > 0) {
            self.value += number;
        } else {
            self.value -= number;
        }
    } else {
        if (self.value > 0) {
            self.value += number * pow(10, -self.lastPow++);
        } else {
            self.value -= number * pow(10, -self.lastPow++);
        }
    }
    
}
- (double)getValue {
    return self.value;
}
- (NSString *)getValueString {
    NSString* str = [[NSString alloc] initWithFormat: @"%g", self.value];
    return str;
}
- (void)deleteValue {
    self.value = 0;
    self.buffer = 0;
    self.decimalPart = NO;
    self.lastPow = 0;
    self.inAction = NO;
}
- (void)changeSign {
    self.value *= -1;
}
- (void)makePercentage{
    [self doResult];
    self.DecimalPart = YES;
    self.value /= 100;
}
- (void)makeDecimal {
    [self doResult];
    self.decimalPart = YES;
    self.lastPow = 0;
}
- (void)doAddition {
    [self doResult];
    self.lastAction = 1;
    self.inAction = YES;
    self.buffer = self.value;
    
}
- (void)doSubtraction {
    self.lastAction = 2;
    [self doResult];
    self.inAction = YES;
    self.buffer = self.value;
}
- (void)doMultiplication {
    self.lastAction = 3;
    self.inAction = YES;
    self.buffer = self.value;
}
- (void)doDivision {
    self.lastAction = 4;
    self.inAction = YES;
    self.buffer = self.value;
}
- (void)doResult {
    switch (self.lastAction) {
        case 1:
            // ADDITION
            self.value += self.buffer;
            break;
        case 2:
            // SUBTRACTION
            self.value -= self.buffer;
            break;
        case 3:
            // MULTIPLICATION
            self.value *= self.buffer;
            break;
        case 4:
            //DIVISION
            self.value /= self.buffer;
            break;
        default:
            break;
    }
    
    self.lastAction = 5;
    self.decimalPart = NO;
    self.buffer = self.value;
    self.inAction = NO;
    self.lastPow = 0;
}

@end
