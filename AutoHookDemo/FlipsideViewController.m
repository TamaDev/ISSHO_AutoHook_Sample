//
//  FlipsideViewController.m
//  AutoHookDemo
//
//  Created by ISSHO on 2013/08/27.
//  Copyright (c) 2013年 ISSHO All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

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

#pragma mark - Actions
#pragma mark - Auto hook placeholders.
- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}


- (IBAction)pushA:(id)sender
{
	
}

- (IBAction)pushB:(id)sender
{
	
}

- (IBAction)pushC:(id)sender
{
	
}
@end
