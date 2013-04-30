//
//  SSLeftViewController.m
//  SideSwiper
//
//  Created by kalyankrishnamurthi on 4/30/13.
//  Copyright (c) 2013 kalyankrishnamurthi. All rights reserved.
//

#import "SSLeftViewController.h"
#import "SSProfileViewController.h"

@interface SSLeftViewController ()

@end

@implementation SSLeftViewController

@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    
    // Configure the cell...
    if ( indexPath.row == 0)
        cell.textLabel.text = @"Home";
    else
        cell.textLabel.text = @"Profile";
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ( indexPath.row == 0 )
    {
        if ( _delegate && [_delegate respondsToSelector:@selector(clickedOptionForHome)])
            [_delegate clickedOptionForHome];
    }
    else
    {
        if ( _delegate && [_delegate respondsToSelector:@selector(clickedOptionForViewController:)]) {
            SSProfileViewController *_profileController = [[SSProfileViewController alloc] initWithNibName:@"SSProfileViewController" bundle:nil];
            [_delegate clickedOptionForViewController:_profileController];
        }
    }
}

@end
