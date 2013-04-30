//
//  SSSwipeViewController.h
//  SideSwiper
//
//  Created by kalyankrishnamurthi on 4/30/13.
//  Copyright (c) 2013 kalyankrishnamurthi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSTransparentView.h"
#import "SSScrollView.h"
#import "SSLeftViewController.h"
#import "SSNavigationController.h"


@interface SSSwipeViewController : UIViewController <SSLeftViewControllerDelegate>
{
    UIViewController *_mainController;
    UIViewController *_leftController;
    
    SSTransparentView *_transparentView;
    
    SSScrollView *_scrollView;
    SSNavigationController *_navController;
    
}

-(id)initWithMain:(UIViewController *)main andLeft:(UIViewController *)left;



@end
