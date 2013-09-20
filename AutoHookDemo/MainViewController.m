//
//  MainViewController.m
//  AutoHookDemo
//
//  Created by ISSHO on 2013/08/27.
//  Copyright (c) 2013年 ISSHO All rights reserved.
//

#import "MainViewController.h"
#import "ISSHOAutoHook.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	[[GAI sharedInstance].defaultTracker trackView:NSStringFromClass([self class])];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

#pragma mark - Auto hook placeholders.
- (IBAction)pushA:(id)sender forEvent:(UIEvent *)event
{
	LOG(@"IBAction:%@:%d",NSStringFromSelector(_cmd),event.type);
}

- (IBAction)pushB:(id)sender forEvent:(UIEvent *)event
{
	LOG(@"IBAction:%@:%d",NSStringFromSelector(_cmd),event.type);
}

- (IBAction)pushC:(id)sender forEvent:(UIEvent *)event
{
	LOG(@"IBAction:%@:%d",NSStringFromSelector(_cmd),event.type);
}


@end
