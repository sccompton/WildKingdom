//
//  FlickrTabBarController.m
//  Wild Kingdom 2
//
//  Created by Apple on 25/01/14.
//  Copyright (c) 2014 Tablified Solutions. All rights reserved.
//

#import "FlickrTabBarController.h"
#import "ViewController.h"

@interface FlickrTabBarController ()

@end

@implementation FlickrTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewController *lions = [storyboard instantiateViewControllerWithIdentifier:@"VCID"];
    lions.title = @"Lions";
    lions.searchTerm = @"Lions";

    ViewController *tigers = [storyboard instantiateViewControllerWithIdentifier:@"VCID"];
    tigers.title = @"Tigers";
    tigers.searchTerm = @"Tigers";
    
    ViewController *bears = [storyboard instantiateViewControllerWithIdentifier:@"VCID"];
    bears.title = @"Bears";
    bears.searchTerm = @"Bears";
    
    NSArray *viewControllers = @[lions, tigers, bears];
    [self setViewControllers:viewControllers animated:YES];
}

@end
