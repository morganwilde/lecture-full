//
//  ViewController.m
//  lecture
//
//  Created by Morgan Wilde on 24/04/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) Calculator *calculator;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // Display
    ViewDisplay *viewDisplay = [[ViewDisplay alloc] initDefaultFrameIn:self.view withText:@"0"];
    self.display = viewDisplay;
    // Inputs
    CGFloat x = viewDisplay.frame.origin.x;
    CGFloat y = viewDisplay.frame.size.height;
    CGFloat width = self.view.frame.size.width/4;
    CGFloat height = (self.view.frame.size.height - viewDisplay.frame.size.height) / 5;
    CGRect input0 = CGRectMake(x, y+4*height, width*2, height); // Zero
    CGRect input1 = CGRectMake(x, y+3*height, width, height);
    CGRect input2 = CGRectMake(x+width, y+3*height, width, height);
    CGRect input3 = CGRectMake(x+2*width, y+3*height, width, height);
    CGRect input4 = CGRectMake(x, y+2*height, width, height);
    CGRect input5 = CGRectMake(x+width, y+2*height, width, height);
    CGRect input6 = CGRectMake(x+2*width, y+2*height, width, height);
    CGRect input7 = CGRectMake(x, y+height, width, height);
    CGRect input8 = CGRectMake(x+width, y+height, width, height);
    CGRect input9 = CGRectMake(x+2*width, y+height, width, height);
    ViewInput *viewInput0 = [[ViewInput alloc] initWithFrame:input0 andLabel:@"0" withPadding:width];
    ViewInput *viewInput1 = [[ViewInput alloc] initWithFrame:input1 andLabel:@"1"];
    ViewInput *viewInput2 = [[ViewInput alloc] initWithFrame:input2 andLabel:@"2"];
    ViewInput *viewInput3 = [[ViewInput alloc] initWithFrame:input3 andLabel:@"3"];
    ViewInput *viewInput4 = [[ViewInput alloc] initWithFrame:input4 andLabel:@"4"];
    ViewInput *viewInput5 = [[ViewInput alloc] initWithFrame:input5 andLabel:@"5"];
    ViewInput *viewInput6 = [[ViewInput alloc] initWithFrame:input6 andLabel:@"6"];
    ViewInput *viewInput7 = [[ViewInput alloc] initWithFrame:input7 andLabel:@"7"];
    ViewInput *viewInput8 = [[ViewInput alloc] initWithFrame:input8 andLabel:@"8"];
    ViewInput *viewInput9 = [[ViewInput alloc] initWithFrame:input9 andLabel:@"9"];
    NSArray *viewInputs = @[viewInput1, viewInput2, viewInput3, viewInput4, viewInput5,
                            viewInput6, viewInput7, viewInput8, viewInput9, viewInput0];
    // Interactivity for the inputs
    for (ViewInput *viewInput in viewInputs) {
        [viewInput addTarget:self action:@selector(inputNumber:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:viewInput];
    }
    
    // Non-number inputs
    CGRect actionEquals     = CGRectMake(x+3*width, y+4*height, width, height);
    CGRect actionPlus       = CGRectMake(x+3*width, y+3*height, width, height);
    CGRect actionMinus      = CGRectMake(x+3*width, y+2*height, width, height);
    CGRect actionMultiply   = CGRectMake(x+3*width, y+1*height, width, height);
    CGRect actionDivide     = CGRectMake(x+3*width, y+0*height, width, height);
    CGRect actionDot        = CGRectMake(x+2*width, y+4*height, width, height);
    CGRect actionDelete     = CGRectMake(x+0*width, y+0*height, width, height);
    CGRect actionSign       = CGRectMake(x+1*width, y+0*height, width, height);
    CGRect actionPercent    = CGRectMake(x+2*width, y+0*height, width, height);
    ViewAction *viewActionEquals    = [[ViewAction alloc] initWithFrame:actionEquals andLabel:@"="];
    ViewAction *viewActionPlus      = [[ViewAction alloc] initWithFrame:actionPlus andLabel:@"+"];
    ViewAction *viewActionMinus     = [[ViewAction alloc] initWithFrame:actionMinus andLabel:@"−"];
    ViewAction *viewActionMultiply  = [[ViewAction alloc] initWithFrame:actionMultiply andLabel:@"×"];
    ViewAction *viewActionDivide    = [[ViewAction alloc] initWithFrame:actionDivide andLabel:@"÷"];
    ViewAction *viewActionDot       = [[ViewAction alloc] initWithFrame:actionDot andLabel:@"."];
    viewActionDot.fill = [[UIColor alloc] initWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0];
    viewActionDot.foreground = [UIColor colorWithRed:15/255.0 green:15/255.0 blue:15/255.0 alpha:1.0];
    
    ViewAction *viewActionDelete    = [[ViewAction alloc] initWithFrame:actionDelete andLabel:@"c"];
    ViewAction *viewActionSign      = [[ViewAction alloc] initWithFrame:actionSign andLabel:@"±"];
    ViewAction *viewActionPercent   = [[ViewAction alloc] initWithFrame:actionPercent andLabel:@"%"];
    NSArray *subactions = @[viewActionDelete, viewActionSign, viewActionPercent];
    
    UIColor *fill = [[UIColor alloc] initWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    UIColor *foreground = [UIColor colorWithRed:15/255.0 green:15/255.0 blue:15/255.0 alpha:1.0];
    for (ViewAction *subaction in subactions) {
        subaction.fill = fill;
        subaction.foreground = foreground;
        [self.view addSubview:subaction];
    }
    
    // Subactions interactivity
    [viewActionDelete addTarget:self action:@selector(deleteValue) forControlEvents:UIControlEventTouchUpInside];
    [viewActionSign addTarget:self action:@selector(changeSign) forControlEvents:UIControlEventTouchUpInside];
    [viewActionPercent addTarget:self action:@selector(makePercentage) forControlEvents:UIControlEventTouchUpInside];
    
    // Action interactivity
    [viewActionDot addTarget:self action:@selector(makeDecimal) forControlEvents:UIControlEventTouchUpInside];
    [viewActionEquals addTarget:self action:@selector(doResult) forControlEvents:UIControlEventTouchUpInside];
    [viewActionPlus addTarget:self action:@selector(doAddition) forControlEvents:UIControlEventTouchUpInside];
    [viewActionMinus addTarget:self action:@selector(doSubtraction) forControlEvents:UIControlEventTouchUpInside];
    [viewActionMultiply addTarget:self action:@selector(doMultiplication) forControlEvents:UIControlEventTouchUpInside];
    [viewActionDivide addTarget:self action:@selector(doDivision) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:viewActionEquals];
    [self.view addSubview:viewActionPlus];
    [self.view addSubview:viewActionMinus];
    [self.view addSubview:viewActionMultiply];
    [self.view addSubview:viewActionDivide];
    [self.view addSubview:viewActionDot];
    [self.view addSubview:viewDisplay];
    
    // Logic
    self.calculator = [[Calculator alloc] init];
}

- (void)inputNumber:(id)sender
{
    ViewInput *input = (ViewInput *)sender;
    [self.calculator appendNumber:(double)[input.label doubleValue]];
    [self reloadDisplay];
    NSLog(@"Hello %f", [self.calculator getValue]);
}
- (void)deleteValue
{
    [self.calculator deleteValue];
    [self reloadDisplay];
}
- (void)changeSign
{
    [self.calculator changeSign];
    [self reloadDisplay];
}
- (void)makePercentage
{
    [self.calculator makePercentage];
    [self reloadDisplay];
}
- (void)makeDecimal
{
    [self.calculator makeDecimal];
    [self reloadDisplay];
}
- (void)doAddition
{
    [self.calculator doAddition];
    [self reloadDisplay];
}
- (void)doSubtraction
{
    [self.calculator doSubtraction];
    [self reloadDisplay];
}
- (void)doMultiplication
{
    [self.calculator doMultiplication];
    [self reloadDisplay];
}
- (void)doDivision
{
    [self.calculator doDivision];
    [self reloadDisplay];
}
- (void)doResult
{
    [self.calculator doResult];
    [self reloadDisplay];
}
- (void)reloadDisplay
{
    self.display.text = [self.calculator getValueString];
    [self.display setNeedsDisplay];
}

@end
