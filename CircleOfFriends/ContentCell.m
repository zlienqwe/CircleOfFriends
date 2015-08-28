//
//  Content.m
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "ContentCell.h"
#import "ContentModel.h"
#import "FeedFrame.h"


@interface ContentCell()

@property (nonatomic, strong) UIImageView * ContentAvatar;
@property (nonatomic, strong) UILabel * ContentUserName;
@property (nonatomic,strong) UILabel * ContentPubType;
@property (nonatomic,strong) UILabel * ContentText;
@property (nonatomic,strong) UILabel * ContentLink;
@property (nonatomic,strong) UIImageView * ContentImages;
@property (nonatomic,strong) UILabel * ContentPubTime;
@property (nonatomic,strong) UILabel * ContentPubFrom;
@property (nonatomic,strong) UIImageView * ContentReplyIcon;
@property (nonatomic,strong) UIImageView * ContentLikeIcon;
@property (nonatomic,strong) UILabel * ContentLikeUserName;
@property (nonatomic,strong) UILabel * ContentReply;

@end

@implementation ContentCell


+ (instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier{
    ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

            cell = [[ContentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsZero;
        [cell setPreservesSuperviewLayoutMargins:NO];
        [cell setLayoutMargins:UIEdgeInsetsZero];


  
    return cell;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.ContentAvatar=[[UIImageView alloc] init];
        [self addSubview:self.ContentAvatar];
        
        
        self.ContentText = [[UILabel alloc] init];
        self.ContentText.font = textFont;
        self.ContentText.numberOfLines = 0;
        self.ContentText.textColor = [UIColor blackColor];
        [self addSubview:self.ContentText];
        
        self.ContentUserName=[[UILabel alloc] init];
        self.ContentUserName.font = usernameFont;
        self.ContentUserName.numberOfLines = 0;
        self.ContentUserName.textColor=[UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:139.0f/255.0f alpha:0.5];
        [self addSubview:self.ContentUserName];

        
        self.ContentImages = [[UIImageView alloc] init];
        [self addSubview:self.ContentImages];
        
        self.ContentPubTime =[[UILabel alloc] init];
        self.ContentPubTime.font = pubTimeFont;
        self.ContentPubTime.textColor=[UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:0.3];
        [self addSubview:self.ContentPubTime];
    
        
        self.ContentReplyIcon = [[UIImageView alloc] init];
        [self addSubview:self.ContentReplyIcon];
    
        
        self.ContentReply = [[UILabel alloc] init];
        [self addSubview:self.ContentReply];
        self.ContentReply.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:0.1];
        self.ContentReply.font = replyFont;
        self.ContentReply.numberOfLines = 0;
        self.ContentReply.textColor=[UIColor blackColor];
        
    }
    return self;
}

- (void) setFeedFrame:(FeedFrame *)feedFrame{
    
    _feedFrame = feedFrame;
    [self settingData];
    [self settingFrame];
}

- (void) settingData{
    
    ContentModel *content = self.feedFrame.content;
    
    self.ContentAvatar.image = [self loadImage:content.contentAvatar];
    
    self.ContentUserName.text = content.contentUserName;
    
    self.ContentText.text = content.contentText;
    
    self.ContentImages.image = [self loadImage:content.contentImages];
    
    self.ContentPubTime.text = content.contentPubTime;
    
    self.ContentReplyIcon.image = [self loadImage:@"reply"];

    

    NSMutableArray * lines = content.contentReply;
    NSUInteger stringCount = [lines count];
    NSMutableString * string =[NSMutableString new];

    for (NSDictionary * line in lines) {
        NSLog(@"%lu",(unsigned long)stringCount);
        NSDictionary * dict = line;
        NSArray * keys = [dict allKeys];
        
        for (NSString * key in keys) {
            NSString * value = [dict objectForKey:key];
            [string appendFormat:@"%@:%@ \n", key, value];

//            for (int i = 0; i < stringCount; i++) {
//                [string stringByAppendingString:@"\n"];
//                NSLog(@"%@",string);
//            
//            }

                    }
    }
    
    self.ContentReply.text = string;

}

- (void) settingFrame{
    
    self.ContentUserName.frame = self.feedFrame.usernameFrame;
    self.ContentAvatar.frame = self.feedFrame.avatarFrame;
    self.ContentText.frame = self.feedFrame.textFrame;
    self.ContentImages.frame = self.feedFrame.imagesFrame;
 
    self.ContentPubTime.frame = self.feedFrame.pubTimeFrame;
    self.ContentReplyIcon.frame = self.feedFrame.replyIconFrame;
    self.ContentReply.frame = self.feedFrame.replyFrame;
}

-(UIImage*)loadImage:(NSString*)pathResource
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:pathResource ofType:@"png"];
    NSData *image = [NSData dataWithContentsOfFile:filePath];
    return [UIImage imageWithData:image];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
