//
//  SSScrollView.m
//  SideSwiper
//
//  Created by kalyankrishnamurthi on 4/30/13.
//  Copyright (c) 2013 kalyankrishnamurthi. All rights reserved.
//

#import "SSTransparentView.h"

@implementation SSTransparentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return NO;
}

@end
