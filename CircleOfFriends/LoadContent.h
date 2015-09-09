//
//  LoadContent.h
//  CircleOfFriends
//
//  Created by Zlien on 8/27/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadJsonFileService.h"

@interface LoadContent : UIViewController

- (void)beginLoadContent:(UITableView *)tableview
                    Data:(NSMutableArray *)arrayData;
- (void)createTableViewFooter:(UITableView *)tableview;

@end
