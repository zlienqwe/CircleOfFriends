//
//  ViewController.h
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    CGRect _rect;
}

@property (nonatomic) UITableView * ContentTableView;
@property (strong, nonatomic) NSMutableArray *data;

@end

