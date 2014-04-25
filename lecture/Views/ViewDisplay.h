//
//  ViewDisplay.h
//  lecture
//
//  Created by Morgan Wilde on 24/04/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewDisplay : UIView

@property (nonatomic) NSString *text;

- (id)initDefaultFrameIn:(UIView *)view withText:(NSString *)text;

@end
