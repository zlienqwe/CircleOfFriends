//
//  LoadContent.m
//  CircleOfFriends
//
//  Created by Zlien on 8/27/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "LoadContent.h"

@interface LoadContent ()

@end

@implementation LoadContent

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)beginLoadContent:(UITableView *)tableview Data:(NSMutableArray *)arrayData{
    UIActivityIndicatorView *tableFooterIndicator=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100,-5,40,40)];
    [tableFooterIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [tableview.tableFooterView addSubview:tableFooterIndicator];
    [tableFooterIndicator startAnimating];
    [self loadingData:tableview Data:arrayData];
}

-(void)loadingData:(UITableView*) tableview Data:(NSMutableArray*) arrayData
{
    [tableview reloadData];
    [self createTableViewFooter:tableview];
}

-(void)createTableViewFooter:(UITableView *)tableview{
    UIView *tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableview.bounds.size.width, 30)];
    
    UILabel *loadMoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,120,20)];
    [loadMoreLabel setCenter:tableFooterView.center];
    [loadMoreLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [loadMoreLabel setText:@"加载中..."];
    
    [tableFooterView addSubview:loadMoreLabel];
    tableview.tableFooterView = tableFooterView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
