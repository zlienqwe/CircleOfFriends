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
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    
    
    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(8,8, 20, 20)];
//    imv.image=[UIImage imageNamed:@"1.png"];

    

    
    
    CGRect ContentUserNameF = CGRectMake(5, 45, 230, 24);
//    CGRect ContentPubTypeF = CGRectMake(230, 23, 95, 24);
    CGRect ContentTextF = CGRectMake(230, 23, 95, 60);
//    CGRect ContentImagesF = CGRectMake(230, 23, 95, 24);
//    CGRect ContentPubTimeF = CGRectMake(230, 23, 95, 24);
    CGRect ContentPubFromF = CGRectMake(5, 0, 230, 64);
//    CGRect ContentReplyIconF = CGRectMake(230, 23, 95, 24);
//    CGRect ContentLikeIconF = CGRectMake(230, 23, 95, 24);
//    CGRect ContentLikeUserNameF = CGRectMake(230, 23, 95, 24);
//    CGRect ContentReplyF = CGRectMake(230, 23, 95, 24);

    
    [self addSubview:imv];

    
    self.ContentUserName = [[UILabel alloc] initWithFrame:ContentUserNameF];
    self.ContentUserName.numberOfLines = 0;
    self.ContentUserName.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.ContentUserName];
    
    self.ContentText = [[UILabel alloc] initWithFrame:ContentTextF];
    self.ContentText.numberOfLines = 0;
    self.ContentText.textColor = [UIColor redColor];
    self.ContentText.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.ContentText];
    
    self.ContentPubFrom = [[UILabel alloc] initWithFrame:ContentPubFromF];
    self.ContentPubFrom.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.ContentPubFrom];
    
    return self;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
