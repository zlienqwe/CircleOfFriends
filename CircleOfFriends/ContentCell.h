//
//  CContentCell.h
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FeedFrame;

@interface ContentCell : UITableViewCell

@property (nonatomic, strong) FeedFrame *feedFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier;

@end
