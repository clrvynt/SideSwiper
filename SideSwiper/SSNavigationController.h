//
//  SSNavigationController.h
//  SideSwiper
//
//  Created by kalyankrishnamurthi on 4/30/13.
//  Copyright (c) 2013 kalyankrishnamurthi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSNavigationController : UINavigationController
{
    UIBarButtonItem *_leftBarButtonItem;
    SEL listSelector;
    id _target;
}

-(id)initWithListSelector:(SEL)selector andTarget:(id)target;
-(void)setRootController:(UIViewController *)controller;

@end
