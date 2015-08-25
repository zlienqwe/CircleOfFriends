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
#define Local @"content.json"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *contentObject;
    NSMutableArray *content;
    Service *service;
    UIActivityIndicatorView *activityIndicator;
    UIImage * albumCover;
    ReadPlist *readPlist;

    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupRefresh];
    service=[Service new];
    readPlist = [ReadPlist new];
    [self getUrlData];
    
    
    
//    contentObject = [service readJson:Local];
    [self initView];


    // Do any additional setup after loading the view, typically from a nib.
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
            ContentMapping *_contentMapping = [[ContentMapping alloc]initWithContentUserName:@"phonenumber" And:@"location" And:@"location" And:@"ContentAvatar"];
            
            contentObject=[_contentMapping mappingContentArray:result];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.ContentTableView reloadData];
                });
            }
        }
     ];
}
-(void)setupRefresh{
}
-(void)initView
{
    
    CGRect frame=CGRectMake(0, -50, 320, self.view.frame.size.height+90);
    self.ContentTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    self.ContentTableView.dataSource = self;
    self.ContentTableView.delegate = self;
    

    
    
    
//    刷新要用
    
//    activityIndicator = [[UIActivityIndicatorView alloc]
//                         initWithActivityIndicatorStyle:
//                         UIActivityIndicatorViewStyleWhiteLarge];
//    activityIndicator.color = [UIColor blackColor];
    
    
    


    [self.view addSubview:self.ContentTableView];
    

    [self.view addSubview:activityIndicator];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellWithIdentifier = @"Cell";
    ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    
    if (cell == nil) {
        cell = [[ContentCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIdentifier];
//        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    
    NSUInteger row = [indexPath row];
    ContentModel *contentOfCircle = (ContentModel*)[contentObject objectAtIndex:row];
    
    cell.ContentUserName.text = contentOfCircle.contentUserName;
    cell.ContentText.text = contentOfCircle.contentText;
    cell.ContentPubFrom.text =contentOfCircle.contentPubFrom;

    return cell;
}
-(NSInteger) readySource{
    
    NSData * contentData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"content" ofType:@"json"]];
    
    NSError * error = nil;
    contentObject = [NSJSONSerialization JSONObjectWithData:contentData options:NSJSONReadingMutableContainers error:&error];
    content = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < [contentObject count]; index++) {
        ContentModel *model = [[ContentModel alloc]init];
        model.contentUserName = [[contentObject objectAtIndex:index] objectForKey:@"ContentUserName"];
        model.contentText = [[contentObject objectAtIndex:index] objectForKey:@"ContentText"];
        model.contentPubFrom = [[contentObject objectAtIndex:index] objectForKey:@"ContentPubFrom"];
        model.contentAvatar = [[contentObject objectAtIndex:index] objectForKey:@"ContentAvatar"];
        [content addObject:model];
        
    }
    return [contentObject count];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 280;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    albumCover= [UIImage imageNamed:@"AlbumCover.png"];
    UIImageView * imageCover = [[UIImageView alloc] initWithImage:albumCover];
    return imageCover;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 75;
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
