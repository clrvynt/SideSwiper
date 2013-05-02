//
//  SSNavigationController.m
//  SideSwiper
//
//  Created by clrvynt on 4/30/13.
//  Copyright (c) 2013 clrvynt. All rights reserved.
//

#import "SSNavigationController.h"

@interface SSNavigationController ()

@end

@implementation SSNavigationController

-(id)initWithListSelector:(SEL)selector andTarget:(id)target
{
    self = [super init];
    if ( self ) {
        listSelector = selector;
        _target = target;
        _leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"list.png"] style:UIBarButtonItemStylePlain target:_target action:listSelector];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // Add the list button.
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setRootController:(UIViewController *)controller
{
    [self setViewControllers:[NSArray arrayWithObject:controller]];
    if ( ! controller.navigationItem.leftBarButtonItem )
        controller.navigationItem.leftBarButtonItem = _leftBarButtonItem;
}

@end
