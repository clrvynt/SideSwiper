//
//  SSLeftViewController.h
//  SideSwiper
//
//  Created by kalyankrishnamurthi on 4/30/13.
//  Copyright (c) 2013 kalyankrishnamurthi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SSLeftViewControllerDelegate <NSObject>

@optional
-(void)clickedOptionForViewController:(UIViewController *)viewController;
-(void)clickedOptionForHome;

@end

@interface SSLeftViewController : UITableViewController

@property (nonatomic, weak) id<SSLeftViewControllerDelegate> delegate;

@end
