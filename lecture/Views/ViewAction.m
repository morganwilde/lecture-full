//
//  ViewAction.m
//  lecture
//
//  Created by Morgan Wilde on 25/04/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import "ViewAction.h"

@implementation ViewAction

- (UIColor *)fill
{
    if (!_fill) {
        _fill = [UIColor colorWithRed:240/255.0 green:135/255.0 blue:15/255.0 alpha:1.0];
    }
    return _fill;
}

- (UIColor *)foreground
{
    if (!_foreground) {
        _foreground = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    }
    return _foreground;
}

- (void)drawRect:(CGRect)rect
{
    // Text attributes
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:36];
    UIColor *color = self.foreground;
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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    
    UIColor *stroke = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    UIColor *fill = self.fill;
    CGContextSetStrokeColor(context, CGColorGetComponents(stroke.CGColor));
    CGContextSetFillColor(context, CGColorGetComponents(fill.CGColor));
    CGContextSetLineWidth(context, 1.0);
    
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, w, 0);
    CGContextAddLineToPoint(context, w, h);
    CGContextAddLineToPoint(context, 0, h);
    
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    // Draw text on top
    [textFormatted drawInRect:textBounds];
}

@end
