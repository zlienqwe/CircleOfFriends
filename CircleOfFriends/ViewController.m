//
//  ViewController.m
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "ViewController.h"
#import "Service.h"
#import "ContentCell.h"
#import "ContentModel.h"
#import "ReadPlist.h"
#import "MJRefresh.h"
#import "ContentInfoMapping.h"
#import "FeedFrame.h"
static const CGFloat MJDuration = 2.0;
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *contentObject;
//    NSMutableArray *content;
    Service *service;
    NSMutableArray *info;
    UIActivityIndicatorView *activityIndicator;
    UIImage * albumCover;
    ReadPlist *readPlist;
    NSInteger cellhight;
    NSMutableDictionary* dicheight;
    
}

@property (nonatomic, strong) NSMutableArray *statusFrames;

@end

@implementation ViewController
static NSString *CellWithIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    service=[Service new];
//    readPlist = [ReadPlist new];
//    [self getUrlData];
    
    
    contentObject = [service readJson:Local];
    
    NSMutableArray *models = [[NSMutableArray alloc] init];
    
    for (ContentModel *content in contentObject) {
        
        FeedFrame *feedF = [[FeedFrame alloc] init];
        feedF.content = content;
        [models addObject:feedF];
    }
     self.statusFrames = [models mutableCopy];
     [self.ContentTableView reloadData];
    
    dicheight=[NSMutableDictionary dictionary];
    cellhight=250;

    [self initView];
    [self setupRefresh];

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setupRefresh{
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）

    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadNewData];
    }];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    header.automaticallyChangeAlpha = YES;
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    

    header.stateLabel.hidden = YES;

    // 马上进入刷新状态
    [header beginRefreshing];
    
    // 设置header
    self.ContentTableView.header = header;
}
- (void)loadNewData
{    for (int i = 0; i<5; i++) {
        [self.data insertObject:MJRandomData atIndex:0];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.ContentTableView reloadData];
        
        [self.ContentTableView.header endRefreshing];
    });
}
- (NSMutableArray *)data
{
    return _data;
}

-(void)initView
{
    CGRect frame=CGRectMake(0, -50, 320, self.view.frame.size.height+90);
    self.ContentTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    self.ContentTableView.dataSource = self;
    self.ContentTableView.delegate = self;

    [self.view addSubview:self.ContentTableView];
    
    [self.view addSubview:activityIndicator];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentCell *cell = [ContentCell cellWithTableView:tableView identifier:@"circleFeeds"];

    cell.feedFrame = self.statusFrames[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    albumCover= [UIImage imageNamed:@"AlbumCover.png"];
    UIImageView * imageCover = [[UIImageView alloc] initWithImage:albumCover];
    return imageCover;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    FeedFrame *feedF = self.statusFrames[indexPath.row];
    return feedF.cellHeight;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statusFrames.count;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
