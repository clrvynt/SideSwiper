//
//  SSHomeViewController.m
//  SideSwiper
//
//  Created by clrvynt on 4/30/13.
//  Copyright (c) 2013 clrvynt. All rights reserved.
//

#import "SSHomeViewController.h"

@interface SSHomeViewController ()

@end

@implementation SSHomeViewController

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
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Hello World";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
