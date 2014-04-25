//
//  ViewInput.h
//  lecture
//
//  Created by Morgan Wilde on 24/04/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewInput : UIButton

@property (nonatomic) NSString *label;
@property (nonatomic) CGFloat padding;

- (id)initWithFrame:(CGRect)frame andLabel:(NSString *)label;
- (id)initWithFrame:(CGRect)frame andLabel:(NSString *)label withPadding:(CGFloat)padding;

@end
