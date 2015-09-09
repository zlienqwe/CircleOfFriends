//
//  LoadContent.m
//  CircleOfFriends
//
//  Created by Zlien on 8/27/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "LoadContent.h"
#import "MMPlaceHolder.h"
@interface LoadContent ()

@end

@implementation LoadContent

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)beginLoadContent:(UITableView *)tableview
                    Data:(NSMutableArray *)arrayData {
  UIActivityIndicatorView *tableFooterIndicator =
      [[UIActivityIndicatorView alloc]
          initWithFrame:CGRectMake(100, -5, 40, 40)];
  [tableFooterIndicator
      setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
  [tableview.tableFooterView addSubview:tableFooterIndicator];
  [tableFooterIndicator showPlaceHolder];
  [tableFooterIndicator startAnimating];
  [self loadingData:tableview Data:arrayData];
}

- (void)loadingData:(UITableView *)tableview Data:(NSMutableArray *)arrayData {
  [tableview reloadData];
  [self createTableViewFooter:tableview];
}

- (void)createTableViewFooter:(UITableView *)tableview {
  UIView *tableFooterView = [[UIView alloc]
      initWithFrame:CGRectMake(0, 0, tableview.bounds.size.width, 30)];
  UILabel *loadMoreLabel =
      [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 60, 20)];
  [loadMoreLabel setCenter:tableFooterView.center];
    [loadMoreLabel setFont:loadLabelFont;
    [loadMoreLabel setText:@"加载中..."];
    [tableFooterView addSubview:loadMoreLabel];
    tableview.tableFooterView = tableFooterView;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

@end
