//
//  ViewDisplay.m
//  lecture
//
//  Created by Morgan Wilde on 24/04/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import "ViewDisplay.h"

#define DISPLAY_PADDING_TOP 30
#define DISPLAY_PADDING_RIGHT 10

@implementation ViewDisplay

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initDefaultFrameIn:(UIView *)view withText:(NSString *)text {
    CGFloat x = view.bounds.origin.x;
    CGFloat y = view.bounds.origin.y;
    CGFloat w = view.bounds.size.width;
    CGFloat h = 215.0/2;
    CGRect frame = CGRectMake(x, y, w, h);
    self = [self initWithFrame:frame];
    if (self) {
        self.text = text;
        UIColor *background = [[UIColor alloc] initWithRed:32/255.0 green:32/255.0 blue:32/255.0 alpha:1.0];
        [self setBackgroundColor:background];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Text attributes
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:62];
    UIColor *color = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentRight;
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName: color,
                                 NSFontAttributeName: font,
                                 NSParagraphStyleAttributeName: paragraph};
    NSAttributedString *textFormatted = [[NSAttributedString alloc] initWithString:self.text attributes:attributes];
    
    // Text bounds
    CGFloat x = self.bounds.origin.x;
    CGFloat y = self.bounds.origin.y + DISPLAY_PADDING_TOP;
    CGFloat w = self.bounds.size.width - DISPLAY_PADDING_RIGHT;
    CGFloat h = self.bounds.size.height;
    CGRect textBounds = CGRectMake(x, y, w, h);
    [textFormatted drawInRect:textBounds];
}

@end
