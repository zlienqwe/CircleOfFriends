//
//  FeedFrame.m
//  CircleOfFriends
//
//  Created by Zlien on 8/26/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "FeedFrame.h"
#import "ContentModel.h"



@implementation FeedFrame

- (void) setContent:(ContentModel *)content{

    _content = content;
    
    CGFloat avatarHeight = 40;
    CGFloat avatarWidth = 40;
    
    CGFloat imagesHeight = 160;
    CGFloat imagesWidth = 140;
    
    CGFloat replyIconHeight = 10;
    CGFloat replyIconWidth = 15;
    
    
    
    self.avatarFrame = CGRectMake(PADDING, PADDING, avatarWidth, avatarHeight);
    
    CGSize usernameSize = [self sizeWithString:_content.contentUserName font:usernameFont maxSize:CGSizeMake(SCREEN_WIDTH - PADDING * 2 - avatarWidth, MAXFLOAT)];
    
    CGFloat usernameLabelH = usernameSize.height;
    CGFloat usernameLabelW = usernameSize.width;

    self.usernameFrame = CGRectMake(PADDING * 2 + avatarWidth, PADDING, usernameLabelW, usernameLabelH);
    
    CGSize textSize = [self sizeWithString:_content.contentText font:textFont maxSize:CGSizeMake(SCREEN_WIDTH - PADDING * 3 - avatarWidth, MAXFLOAT)];
    
    CGFloat textLableH = textSize.height;
    CGFloat textLableW = textSize.width;
    
    self.textFrame = CGRectMake(PADDING * 2 + avatarWidth, PADDING * 2 + usernameLabelH, textLableW, textLableH);
    
    
    if (_content.contentImages == nil) {
        CGFloat imageH = 0 - PADDING;
        imagesHeight = imageH;
        
    }else{
    self.imagesFrame = CGRectMake(PADDING * 2 + avatarWidth, PADDING * 3 + textLableH + usernameLabelH, imagesWidth, imagesHeight);
    }
    CGSize pubTimeSize = [self sizeWithString:_content.contentPubTime font:pubTimeFont maxSize:CGSizeMake(SCREEN_WIDTH - PADDING * 2 - avatarWidth, MAXFLOAT)];
    
    CGFloat pubTimeLabelH = pubTimeSize.height;
    CGFloat pubTimeLabelW = pubTimeSize.width;
    
    self.pubTimeFrame = CGRectMake(PADDING * 2 + avatarWidth, PADDING * 4 + usernameLabelH + textLableH + imagesHeight,pubTimeLabelW, pubTimeLabelH);
    
    
    
    self.replyIconFrame = CGRectMake(SCREEN_WIDTH-4 * PADDING, PADDING * 4 + usernameLabelH + textLableH + imagesHeight, replyIconWidth, replyIconHeight);
    

    
    CGSize replySize = [self sizeWithString:_content.contentReply font:replyFont maxSize:CGSizeMake(SCREEN_WIDTH-PADDING*3-avatarWidth, MAXFLOAT)];
    CGFloat replyLabelH = replySize.height;
    CGFloat replyLabelW = replySize.width;
    
    self.replyFrame = CGRectMake(PADDING * 2 + avatarWidth, PADDING * 6 + usernameLabelH + textLableH + imagesHeight , replyLabelW, replyLabelH);
    
    self.cellHeight = usernameLabelH + textLableH + imagesHeight + pubTimeLabelH + replyLabelH+ 6 * PADDING;
}


- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName : font};

    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

@end
