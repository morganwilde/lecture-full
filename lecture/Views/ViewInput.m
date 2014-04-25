//
//  ViewInput.m
//  lecture
//
//  Created by Morgan Wilde on 24/04/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import "ViewInput.h"

@implementation ViewInput

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIColor *background = [[UIColor alloc] initWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0];
        [self setBackgroundColor:background];
        self.label = @"";
        self.padding = 0;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andLabel:(NSString *)label {
    self = [self initWithFrame:frame];
    if (self) {
        self.label = label;
        self.padding = 0;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andLabel:(NSString *)label withPadding:(CGFloat)padding {
    self = [self initWithFrame:frame andLabel:label];
    if (self) {
        self.padding = padding;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Text attributes
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:36];
    UIColor *color = [UIColor colorWithRed:15/255.0 green:15/255.0 blue:15/255.0 alpha:1.0];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName: color,
                                 NSFontAttributeName: font,
                                 NSParagraphStyleAttributeName: paragraph};
    NSAttributedString *textFormatted = [[NSAttributedString alloc] initWithString:self.label attributes:attributes];
    
    // Text bounds
    CGFloat x = self.bounds.origin.x;
    CGFloat y = self.bounds.size.height/2.0 - textFormatted.size.height/2.0;
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    CGRect textBounds = CGRectMake(x, y, w - self.padding, h);
    
    
    // Drawing
    CGContextBeginPath(context);
    
    UIColor *stroke = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    UIColor *fill = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0];
    CGContextSetStrokeColor(context, CGColorGetComponents(stroke.CGColor));
    CGContextSetFillColor(context, CGColorGetComponents(fill.CGColor));
    CGContextSetLineWidth(context, 1.0);
    
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, w, 0);
    CGContextAddLineToPoint(context, w, h);
    CGContextAddLineToPoint(context, 0, h);
    
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathStroke);
    
    // Text draw
    [textFormatted drawInRect:textBounds];
}

@end