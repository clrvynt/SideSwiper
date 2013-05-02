//
//  SSSwipeViewController.m
//  SideSwiper
//
//  Created by clrvynt on 4/30/13.
//  Copyright (c) 2013 clrvynt. All rights reserved.
//

#import "SSSwipeViewController.h"
#import "SSNavigationController.h"

@interface SSSwipeViewController ()

@end

@implementation SSSwipeViewController

-(id)initWithMain:(UIViewController *)main andLeft:(UIViewController *)left
{
    self = [super init];
    if ( self ) {
        _mainController = main;
        _leftController = left;
        
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
    
    // set delegate
    if ( [_leftController isKindOfClass:[SSLeftViewController class]] )
        ((SSLeftViewController *)_leftController).delegate = self;
    
	// Do any additional setup after loading the view.
    
    
    // Add left controller to the bottom
    [self.view addSubview:_leftController.view];

    // Now add a UIScrollView with a transparent portion to show the back view
    // and the mainController added to it.
    
    _scrollView = [[SSScrollView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.contentSize = CGSizeMake(_leftController.view.frame.size.width + _mainController.view.frame.size.width, self.view.frame.size.height);
    
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    
    // Add transparent uiview
    _transparentView = [[SSTransparentView alloc] initWithFrame:_leftController.view.frame];
    _transparentView.backgroundColor = [UIColor clearColor];
    
    [_scrollView addSubview:_transparentView];
    [self.view addSubview:_scrollView];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _navController = [[SSNavigationController alloc] initWithListSelector:@selector(listClicked:) andTarget:self];
    [_navController setRootController:_mainController];
    
    _navController.view.frame = CGRectMake(_leftController.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    // Add a tap recognizer to the navigation stuff.
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(navViewClicked:)];
    [tapper setNumberOfTapsRequired:1];
    [_navController.view addGestureRecognizer:tapper];

    [_scrollView addSubview:_navController.view];
    
    _scrollView.contentOffset = CGPointMake(_leftController.view.frame.size.width, 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)listClicked:(id)sender
{
    if ( _scrollView.contentOffset.x != 0 )
        [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    else
        [_scrollView setContentOffset:CGPointMake(_leftController.view.frame.size.width, 0) animated:YES];
    
}

-(void)navViewClicked:(id)sender
{
    [_scrollView setContentOffset:CGPointMake(_leftController.view.frame.size.width, 0) animated:YES];
}

-(void)clickedOptionForViewController:(UIViewController *)viewController
{
    // Restore swiped out view
    [_scrollView setContentOffset:CGPointMake(_leftController.view.frame.size.width, 0) animated:YES];
    [_navController setRootController:viewController];
}

-(void)clickedOptionForHome
{
    // Restore swiped out view
    [_scrollView setContentOffset:CGPointMake(_leftController.view.frame.size.width, 0) animated:YES];
    [_navController setRootController:_mainController];
}


@end
