//
//  RootViewController.m
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "RootViewController.h"
#import "CircleOfFriendsViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)goToCircleOfFriends:(id)sender
{
    CircleOfFriendsViewController *viewController = [[CircleOfFriendsViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
    viewController.title = @"朋友圈";
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
