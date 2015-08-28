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
#import "ContentInfoMapping.h"
#import "FeedFrame.h"
#import "LoadContent.h"
#import "MJRefresh.h"

static NSString *CellWithIdentifier = @"Cell";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *contentObject;
    Service *service;
    UIActivityIndicatorView *activityIndicator;
    UIImage * albumCover;
    UIImage * selfAvatarImage;
    ReadPlist *readPlist;
    LoadContent * loadContent;
    NSMutableArray *models;
}

@property (nonatomic, strong) NSMutableArray *statusFrames;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    service = [Service new];
    loadContent = [LoadContent new];
    contentObject = [service readJson:Local];
    [self setFeedFrame];
    [self.ContentTableView reloadData];
    [self initTableView];
    [self initCameraButton];
    [self initTableViewHeaderView];
    [self setupRefresh];
}
-(void)setupRefresh{
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                [self loadNewData];
            }];
        header.automaticallyChangeAlpha = YES;
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        self.ContentTableView.header = header;
}

- (void)loadNewData
{
        for (int i = 0; i<5; i++) {
                [self.data insertObject:MJRandomData atIndex:0];
        }
                [self.ContentTableView reloadData];
           [self.ContentTableView.header endRefreshing];
}

- (NSMutableArray *)data
{
        if (!_data) {
                self.data = [NSMutableArray array];
            }
        return _data;
}

-(void)setFeedFrame
{
    models = [[NSMutableArray alloc] init];
    for (ContentModel *content in contentObject) {
        FeedFrame *feedF = [[FeedFrame alloc] init];
        feedF.content = content;
        [models addObject:feedF];
    }
    self.statusFrames = [models mutableCopy];
}

-(void)initCameraButton
{
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera  target:self action:nil];
    self.navigationItem.rightBarButtonItem = cameraButton;
}

-(void)initTableViewHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 240)];
    headerView.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 240)];
    imageView.image = [UIImage imageNamed:@"AlbumCover"];
    UIImageView * imageAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH -PADDING - 60, 200, 60, 60)];
    imageAvatar.image = [UIImage imageNamed:@"ImageAvatar"];
    imageAvatar.layer.borderWidth = 2;
    imageAvatar.layer.borderColor = [UIColor whiteColor].CGColor;
    UILabel * userName = [[UILabel alloc] init];
    userName.frame = CGRectMake(SCREEN_WIDTH-PADDING-imageAvatar.frame.size.width - 45, 210, 45, 18);
    userName.textColor = [UIColor whiteColor];
    userName.font = [UIFont boldSystemFontOfSize:16.0];
    userName.text = @"Zlien";
    userName.textAlignment = NSTextAlignmentLeft;
    [headerView addSubview:imageView];
    [headerView addSubview:userName];
    [headerView addSubview:imageAvatar];
    self.ContentTableView.tableHeaderView = headerView;
}

-(void)initTableView
{
    CGRect frame=CGRectMake(0, -50, 320, self.view.frame.size.height+90);
    self.ContentTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    self.ContentTableView.dataSource = self;
    self.ContentTableView.delegate = self;
    [self.view addSubview:self.ContentTableView];
    [loadContent createTableViewFooter:self.ContentTableView];
    activityIndicator = [[UIActivityIndicatorView alloc]
                         initWithActivityIndicatorStyle:
                         UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.color = [UIColor redColor];
    activityIndicator.frame =CGRectMake(15, 75, 40, 40);
    [self.view addSubview:activityIndicator];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentCell *cell = [ContentCell cellWithTableView:tableView identifier:@"circleFeeds"];
    cell.feedFrame = self.statusFrames[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeedFrame *feedF = self.statusFrames[indexPath.row];
    return feedF.cellHeight;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
   if (scrollView.contentOffset.y<= -60) {
        [activityIndicator startAnimating];
        [contentObject removeAllObjects];
        contentObject=[service readJson:NEW];
        [self setFeedFrame];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.ContentTableView reloadData];
        });
        [activityIndicator stopAnimating];
        return;
    }
    contentObject=[service readJson:MORE];

    models = [[NSMutableArray alloc] init];
    for (ContentModel *content in contentObject) {
        FeedFrame *feedF = [[FeedFrame alloc] init];
        feedF.content = content;
        [models addObject:feedF];
    }
    [self.statusFrames addObjectsFromArray:models];
    [self.ContentTableView reloadData];
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end