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
static const CGFloat MJDuration = 2.0;
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

#define Local @"content.json"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *contentObject;
    NSMutableArray *content;
    Service *service;
    NSMutableArray *info;
    UIActivityIndicatorView *activityIndicator;
    UIImage * albumCover;
    ReadPlist *readPlist;
    NSInteger cellhight;
    NSMutableDictionary* dicheight;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    service=[Service new];
//    readPlist = [ReadPlist new];
//    [self getUrlData];
    
    
    contentObject = [service readJson:Local];
    
    
    
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

-(void)getUrlData{
    NSString *url = [readPlist urlAddress];

    [service urlJson:url                 AsynBack:^(NSURLResponse *response, NSData *data, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
            [activityIndicator stopAnimating];
        });
        if (error) {
            UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"网络错误" message:@"请重试" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
            [alter show];
        }else{
            __autoreleasing NSError* error = nil;
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            //            ContentMapping *_contentMapping = [[ContentMapping alloc]initWithContentUserName:@"ContentUserName" And:@"ContentText" And:@"ContentPubFrom" And:@"ContentAvatar"];
            ContentMapping *_contentMapping = [[ContentMapping alloc]initWithContentUserName:@"phonenumber" And:@"location" And:@"calltime" And:@"ContentAvatar" And:@"ContentImages" And:@"ContentReply"];
            
            contentObject=[_contentMapping mappingContentArray:result];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.ContentTableView reloadData];
                });
            }
        }
     ];
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
    
    static NSString *CellWithIdentifier = @"Cell";
    ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    
    NSUInteger row = [indexPath row];
    ContentModel * contentOfCircle=(ContentModel*)[ContentInfoMapping contentInfo:[contentObject objectAtIndex: row]];

    if (cell == nil) {
        cell = [[ContentCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIdentifier
boolImage:[self heightCell:contentOfCircle]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    cell.ContentUserName.text = contentOfCircle.contentUserName;
    cell.ContentText.text = contentOfCircle.contentText;
    cell.ContentPubFrom.text =contentOfCircle.contentPubFrom;
    if ([self heightCell:contentOfCircle]) {
                cell.ContentImages.image=[self loadImage:contentOfCircle.contentImages];
           }
    cell.ContentAvatar.image = [self loadImage:contentOfCircle.contentAvatar];
    cell.ContentReplyIcon.image = [self loadImage:@"reply"];
    cell.ContentReply.text = contentOfCircle.contentReply;
    return cell;
}
-(BOOL)heightCell:(ContentModel *)contentInfoList
{
    if (contentInfoList.contentImages==nil) {
        return NO;
    }
    return YES;
}
-(UIImage*)loadImage:(NSString*)pathResource
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:pathResource ofType:@"png"];
    NSData *image = [NSData dataWithContentsOfFile:filePath];
    return [UIImage imageWithData:image];
}


//-(NSInteger) readySource{
//    
//    NSData * contentData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"content" ofType:@"json"]];
//    
//    NSError * error = nil;
//    contentObject = [NSJSONSerialization JSONObjectWithData:contentData options:NSJSONReadingMutableContainers error:&error];
//    content = [[NSMutableArray alloc] init];
//    for (NSInteger index = 0; index < [contentObject count]; index++) {
//        ContentModel *model = [[ContentModel alloc]init];
//        model.contentUserName = [[contentObject objectAtIndex:index] objectForKey:@"ContentUserName"];
//        model.contentText = [[contentObject objectAtIndex:index] objectForKey:@"ContentText"];
//        model.contentPubFrom = [[contentObject objectAtIndex:index] objectForKey:@"ContentPubFrom"];
//        model.contentAvatar = [[contentObject objectAtIndex:index] objectForKey:@"ContentAvatar"];
//        model.contentImages = [[contentObject objectAtIndex:index] objectForKey:@"ContentImages"];
//
//        
//        [content addObject:model];
//        
//    }
//
//    return [contentObject count];
//    
//}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 230;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    albumCover= [UIImage imageNamed:@"AlbumCover.png"];
    UIImageView * imageCover = [[UIImageView alloc] initWithImage:albumCover];
    return imageCover;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSUInteger row = [indexPath row];
    ContentModel *contentOfCircle=(ContentModel*)[ContentInfoMapping contentInfo:[contentObject objectAtIndex: row]];
    
    if (contentOfCircle.contentImages==nil) {
        cellhight-=160;
        return cellhight;
    }
 
    else
    {
        cellhight=250;
    }
    
    
    

    
    return cellhight;
    
    

}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [contentObject count];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
