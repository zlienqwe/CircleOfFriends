//
//  ViewController.m
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "CircleOfFriendsViewController.h"
#import "ReadJsonFileService.h"
#import "ContentCell.h"
#import "ContentModel.h"
#import "ContentInfoMapping.h"
#import "FeedFrame.h"
#import "LoadContent.h"
#import "MJRefresh.h"

static NSString *cellWithIdentifier = @"Cell";

@interface CircleOfFriendsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *contentObject;
    ReadJsonFileService *readJsonFileService;
    UIActivityIndicatorView *activityIndicator;
    UIImage * albumCover;
    UIImage * selfAvatarImage;
    LoadContent * loadContent;
    NSMutableArray *models;
}

@property (nonatomic, strong) NSMutableArray *statusFrames;

@end

@implementation CircleOfFriendsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initBarCameraButton];
    [self initTableView];
    [self initTableViewHeaderView];
    readJsonFileService = [ReadJsonFileService new];
    contentObject = [readJsonFileService readJsonFile:LocalJsonFile];
    [self setFeedFrame];
    loadContent = [LoadContent new];
    [self.contentTableView reloadData];
    [self setupRefresh];
}


-(void)setupRefresh
{
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                [self loadNewData];}];
        header.automaticallyChangeAlpha = YES;
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        self.contentTableView.header = header;
}


- (void)loadNewData
{
        for (int i = 0; i<5; i++) {
                [self.data insertObject:MJRandomData atIndex:0];
        }
            [self.contentTableView reloadData];
            [self.contentTableView.header endRefreshing];
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


-(void)initBarCameraButton
{
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera  target:self action:nil];
    self.navigationItem.rightBarButtonItem = cameraButton;
}


-(void)initTableViewHeaderView
{
    int selfAvatarWeight = 60;
    int selfAvatarHeight = 60;
    int selfAvatarFromTop = 200;
    int selfAvatarBoederWidth = 2;
    int selfUserNameFromTop = 210;
    int selfUserNameWeight = 45;
    int selfUserNameHeight = 18;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEADERHEIGHT)];
    headerView.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, HEADERHEIGHT)];
    imageView.image = [UIImage imageNamed:@"AlbumCover"];
    UIImageView * imageAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH -PADDING - selfAvatarWeight, selfAvatarFromTop, selfAvatarWeight, selfAvatarHeight)];
    imageAvatar.image = [UIImage imageNamed:@"ImageAvatar"];
    imageAvatar.layer.borderWidth = selfAvatarBoederWidth;
    imageAvatar.layer.borderColor = [UIColor whiteColor].CGColor;
    UILabel * userName = [[UILabel alloc] init];
    userName.frame = CGRectMake(SCREEN_WIDTH-PADDING-selfAvatarWeight - selfUserNameWeight, selfUserNameFromTop, selfUserNameWeight, selfUserNameHeight);
    userName.textColor = [UIColor whiteColor];
    userName.font = userNameFont;
    userName.text = @"Zlien";
    userName.textAlignment = NSTextAlignmentLeft;
    [headerView addSubview:imageView];
    [headerView addSubview:userName];
    [headerView addSubview:imageAvatar];
    self.contentTableView.tableHeaderView = headerView;
}


-(void)initTableView
{
    CGRect frame=CGRectMake(0, -50, SCREEN_WIDTH, self.view.frame.size.height+90);
    self.contentTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    self.contentTableView.dataSource = self;
    self.contentTableView.delegate = self;
    [self.view addSubview:self.contentTableView];
    [loadContent createTableViewFooter:self.contentTableView];
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
        contentObject=[readJsonFileService readJsonFile:NewContentJsonFile];
        [self setFeedFrame];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.contentTableView reloadData];
        });
        [activityIndicator stopAnimating];
        return;
    }
    contentObject=[readJsonFileService readJsonFile:MoreContentJsonFile];

    models = [[NSMutableArray alloc] init];
    for (ContentModel *content in contentObject) {
        FeedFrame *feedF = [[FeedFrame alloc] init];
        feedF.content = content;
        [models addObject:feedF];
    }
    [self.statusFrames addObjectsFromArray:models];
    [self.contentTableView reloadData];
    
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end