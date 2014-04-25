//
//  ViewController.h
//  lecture
//
//  Created by Morgan Wilde on 24/04/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Views/ViewDisplay.h"
#import "Views/ViewInput.h"
#import "Views/ViewAction.h"
#import "Models/Calculator.h"

@interface ViewController : UIViewController

@property (nonatomic) ViewDisplay *display;

- (void)inputNumber:(id)sender;
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
