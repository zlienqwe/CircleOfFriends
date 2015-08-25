//
//  Content.m
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "ContentCell.h"

@implementation ContentCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier boolImage:(BOOL)boolimage{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        int ZJHeigth=0;
        // Initialization code
        self.ContentAvatar=[[UIImageView alloc]initWithFrame:CGRectMake(15, ZJHeigth+8, 30, 30)];
        ZJHeigth+=8;
        [self addSubview:self.ContentAvatar];
        
        
        
        
        self.ContentUserName=[[UILabel alloc]initWithFrame:CGRectMake(52, ZJHeigth, 40, 15)];
        self.ContentUserName.font = [UIFont italicSystemFontOfSize:15];
        self.ContentUserName.textColor=[UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:139.0f/255.0f alpha:0.5];
        ZJHeigth+=20;
        [self addSubview:self.ContentUserName];
        
        self.ContentText=[[UILabel alloc]initWithFrame:CGRectMake(52, ZJHeigth, 160, 15)];
        self.ContentText.numberOfLines = 0;

        self.ContentText.font = [UIFont italicSystemFontOfSize:15];
        ZJHeigth+=17;
        [self addSubview:self.ContentText];
        
        if (boolimage==YES) {
            self.ContentImages=[[UIImageView alloc]initWithFrame:CGRectMake(52, ZJHeigth, 160, 160)];
            ZJHeigth+=165;
            [self addSubview:self.ContentImages];
        }
        
        
        self.ContentPubFrom = [[UILabel alloc]initWithFrame:CGRectMake(52, ZJHeigth, 60, 10)];
        self.ContentPubFrom.font = [UIFont italicSystemFontOfSize:10];
        [self addSubview:self.ContentPubFrom];
        
        self.ContentReplyIcon=[[UIImageView alloc]initWithFrame:CGRectMake(325, ZJHeigth, 20, 12)];
        ZJHeigth+=15;
        [self addSubview:self.ContentReplyIcon];
        
        self.ContentReply = [[UILabel alloc]initWithFrame:CGRectMake(52, ZJHeigth, 290, 20)];
        self.ContentReply.backgroundColor=[UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:0.5];
        self.ContentReply.font = [UIFont italicSystemFontOfSize:15];
        ZJHeigth+=24;
        [self addSubview:self.ContentReply];
        
        self.separator = [[UIView alloc] initWithFrame:CGRectMake(0, ZJHeigth, 380, 1)];
        self.separator.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:0.5];
        [self addSubview:self.separator];

    }
    return self;
}
//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    
//    
//    
//    
//    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(8,8, 20, 20)];
////    imv.image=[UIImage imageNamed:@"1.png"];
//
//    
//
//    
//    
//    CGRect ContentUserNameF = CGRectMake(5, 45, 230, 24);
////    CGRect ContentPubTypeF = CGRectMake(230, 23, 95, 24);
//    CGRect ContentTextF = CGRectMake(230, 23, 95, 60);
////    CGRect ContentImagesF = CGRectMake(230, 23, 95, 24);
////    CGRect ContentPubTimeF = CGRectMake(230, 23, 95, 24);
//    CGRect ContentPubFromF = CGRectMake(5, 0, 230, 64);
////    CGRect ContentReplyIconF = CGRectMake(230, 23, 95, 24);
////    CGRect ContentLikeIconF = CGRectMake(230, 23, 95, 24);
////    CGRect ContentLikeUserNameF = CGRectMake(230, 23, 95, 24);
////    CGRect ContentReplyF = CGRectMake(230, 23, 95, 24);
//
//    
//    [self addSubview:imv];
//
//    
//    self.ContentUserName = [[UILabel alloc] initWithFrame:ContentUserNameF];
//    self.ContentUserName.numberOfLines = 0;
//    self.ContentUserName.font = [UIFont systemFontOfSize:16];
//    [self addSubview:self.ContentUserName];
//    
//    self.ContentText = [[UILabel alloc] initWithFrame:ContentTextF];
////自动换行
//    self.ContentText.numberOfLines = 0;
//    self.ContentText.textColor = [UIColor redColor];
//    self.ContentText.font = [UIFont systemFontOfSize:12];
//    [self addSubview:self.ContentText];
//    
//    self.ContentPubFrom = [[UILabel alloc] initWithFrame:ContentPubFromF];
//    self.ContentPubFrom.font = [UIFont systemFontOfSize:12];
//    [self addSubview:self.ContentPubFrom];
//    
//    return self;
//    
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
