//
//  ViewController.h
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

@interface CircleOfFriendsViewController : UIViewController {
  CGRect _rect;
}

@property(nonatomic) UITableView *contentTableView;
@property(strong, nonatomic) NSMutableArray *data;

@end
