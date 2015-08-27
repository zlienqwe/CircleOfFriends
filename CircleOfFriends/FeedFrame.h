//
//  FeedFrame.h
//  CircleOfFriends
//
//  Created by Zlien on 8/26/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ContentModel;

@interface FeedFrame : NSObject

@property (nonatomic, assign) CGRect usernameFrame;
@property (nonatomic, assign) CGRect avatarFrame;
@property (nonatomic, assign) CGRect textFrame;
@property (nonatomic, assign) CGRect imagesFrame;
@property (nonatomic, assign) CGRect pubTimeFrame;
@property (nonatomic, assign) CGRect replyIconFrame;
@property (nonatomic, assign) CGRect replyFrame;


@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) ContentModel *content;

@end
