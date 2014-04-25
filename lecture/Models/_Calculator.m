//
//  Calculator.m
//  lecture
//
//  Created by Morgan Wilde on 25/04/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#include <math.h>
#import "Calculator.h"
#define EPSILON 0.00001

@implementation Calculator

- (id)init
{
    self = [super init];
    if (self) {
        self.value = 0.0;
        self.buffer = 0.0;
        self.decimalPart = NO;
        self.inAction = NO;
        self.lastAction = 0;
    }
    return self;
}

- (void)appendNumber:(double)number
{
    if (self.isDecimalPart) {
        int power = 1;
        double temp = self.value;
        while ((temp - floor(temp)) > EPSILON) {
            temp *= 10;
            power++;
        }
        self.value = self.value + number*pow(10, -power);
    } else {
        self.value = self.value*10 + number;
    }
}
- (double)getValue
{
    return self.value;
}
- (NSString *)getValueString
{
    NSString *string;
    
    double valueFloor = floor(self.value);
    if ((self.value - valueFloor) < EPSILON) {
        string = [[NSString alloc] initWithFormat:@"%d", (int)self.value];
    } else {
        string = [[NSString alloc] initWithFormat:@"%.5g", (double)self.value];
    }
    
    return string;
}
- (void)deleteValue
{
    self.value = 0;
    self.buffer = 0;
    self.decimalPart = NO;
}
- (void)changeSign
{
    self.value *= -1;
}
- (void)makePercentage
{
    self.value /= 100;
    self.decimalPart = YES;
}
- (void)makeDecimal
{
    self.decimalPart = YES;
}
- (void)doAddition
{
    if (self.inAction) {
        self.buffer += self.value;
    } else {
        self.buffer = self.value;
    }
    self.value = 0.0;
    self.inAction = YES;
    self.lastAction = 1;
    self.decimalPart = NO;
}
- (void)doSubtraction
{
    if (self.inAction) {
        self.buffer -= self.value;
    } else {
        self.buffer = self.value;
    }
    self.value = 0.0;
    self.inAction = YES;
    self.decimalPart = NO;
    self.lastAction = 2;
}
- (void)doMultiplication
{
    if (self.inAction) {
        self.buffer *= self.value;
    } else {
        self.buffer = self.value;
    }
    self.value = 0.0;
    self.inAction = YES;
    self.decimalPart = NO;
    self.lastAction = 3;
}
- (void)doDivision
{
    if (self.inAction) {
        self.buffer /= self.value;
    } else {
        self.buffer = self.value;
    }
    self.value = 0.0;
    self.inAction = YES;
    self.decimalPart = NO;
    self.lastAction = 4;
}
- (void)doResult
{
    if (self.inAction) {
        
        if (self.lastAction == 1) {
            self.buffer += self.value;
        } else if (self.lastAction == 2) {
            self.buffer -= self.value;
        } else if (self.lastAction == 3) {
            self.buffer *= self.value;
        } else if (self.lastAction == 4) {
            self.buffer /= self.value;
        }
        self.value = self.buffer;
        NSLog(@"Result, buffer = %f", self.buffer);
        self.buffer = 0.0;
        self.lastAction = 0;
        self.inAction = NO;
        
    }
}

@end
