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
#import "MMPlaceHolder.h"

@interface ContentCell ()

@property (nonatomic, strong) UIImageView *contentAvatar;
@property (nonatomic, strong) UILabel     *contentUserame;
@property (nonatomic, strong) UILabel     *contentText;
@property (nonatomic, strong) UIImageView *contentImages;
@property (nonatomic, strong) UILabel     *contentPubTime;
@property (nonatomic, strong) UIImageView *contentReplyIcon;
@property (nonatomic, strong) UILabel     *contentReply;

@end

@implementation ContentCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
                       identifier:(NSString *)identifier {
  ContentCell *cell   = [tableView dequeueReusableCellWithIdentifier:identifier];
  cell                = [[ContentCell alloc] initWithStyle:UITableViewCellStyleDefault
                            reuseIdentifier:identifier];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  cell.separatorInset = UIEdgeInsetsZero;
  [cell setPreservesSuperviewLayoutMargins:NO];
  [cell setLayoutMargins:UIEdgeInsetsZero];
  return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier {
  self                              = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
  self.contentAvatar                = [[UIImageView alloc] init];
    [self addSubview:self.contentAvatar];
    [self.contentAvatar showPlaceHolder];

  self.contentText                  = [[UILabel alloc] init];
  self.contentText.font             = textFont;
  self.contentText.numberOfLines    = 0;
  self.contentText.textColor        = [UIColor blackColor];
    [self addSubview:self.contentText];
    [self.contentText showPlaceHolder];

  self.contentUserame               = [[UILabel alloc] init];
  self.contentUserame.font          = usernameFont;
  self.contentUserame.numberOfLines = 0;
  self.contentUserame.textColor     = [UIColor colorWithRed:0.0f / 255.0f
                                                    green:0.0f / 255.0f
                                                     blue:139.0f / 255.0f
                                                    alpha:0.5];
    [self addSubview:self.contentUserame];
    [self.contentUserame showPlaceHolder];

  self.contentImages                = [[UIImageView alloc] init];
    [self addSubview:self.contentImages];
    [self.contentImages showPlaceHolder];

  self.contentPubTime               = [[UILabel alloc] init];
  self.contentPubTime.font          = pubTimeFont;
  self.contentPubTime.textColor     = [UIColor colorWithRed:0.0f / 255.0f
                                                    green:0.0f / 255.0f
                                                     blue:0.0f / 255.0f
                                                    alpha:0.3];
    [self addSubview:self.contentPubTime];
    [self.contentPubTime showPlaceHolder];

  self.contentReplyIcon             = [[UIImageView alloc] init];
    [self addSubview:self.contentReplyIcon];
    [self.contentReplyIcon showPlaceHolder];

  self.contentReply                 = [[UILabel alloc] init];
  self.contentReply.backgroundColor = [UIColor colorWithRed:0.0f / 255.0f
                                                        green:0.0f / 255.0f
                                                         blue:0.0f / 255.0f
                                                        alpha:0.1];
  self.contentReply.font            = replyFont;
  self.contentReply.numberOfLines   = 0;
  self.contentReply.textColor       = [UIColor blackColor];
    [self addSubview:self.contentReply];
    [self.contentReply showPlaceHolder];
  }
  return self;
}

- (void)setFeedFrame:(FeedFrame *)feedFrame {
  _feedFrame = feedFrame;
  [self settingData];
  [self settingFrame];
}

- (void)settingData {
  ContentModel *content = self.feedFrame.content;
  self.contentAvatar.image = [self loadImage:content.contentAvatar];
  self.contentUserame.text = content.contentUserName;
  self.contentText.text = content.contentText;
  self.contentImages.image = [self loadImage:content.contentImages];
  self.contentPubTime.text = content.contentPubTime;
  self.contentReplyIcon.image = [self loadImage:@"reply"];

  NSMutableArray *lines = content.contentReply;
  NSMutableString *string = [NSMutableString new];
  for (NSMutableDictionary *line in lines) {
    NSMutableDictionary *dict = line;
    NSArray *keys = [dict allKeys];
    for (NSString *key in keys) {
      NSString *value = [dict objectForKey:key];
      [string appendFormat:@"%@:%@ \n", key, value];
    }
  }
  self.contentReply.text = string;
}

- (void)settingFrame {
  self.contentUserame.frame = self.feedFrame.usernameFrame;
  self.contentAvatar.frame = self.feedFrame.avatarFrame;
  self.contentText.frame = self.feedFrame.textFrame;
  self.contentImages.frame = self.feedFrame.imagesFrame;
  self.contentPubTime.frame = self.feedFrame.pubTimeFrame;
  self.contentReplyIcon.frame = self.feedFrame.replyIconFrame;
  self.contentReply.frame = self.feedFrame.replyFrame;
}

- (UIImage *)loadImage:(NSString *)pathResource {
  NSString *filePath =
      [[NSBundle mainBundle] pathForResource:pathResource ofType:@"png"];
  NSData *image = [NSData dataWithContentsOfFile:filePath];
  return [UIImage imageWithData:image];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
}

@end
