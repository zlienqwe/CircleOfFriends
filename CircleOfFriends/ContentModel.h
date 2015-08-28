//
//  ContentModel.h
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentModel : NSObject
@property NSString * contentUserName;
@property NSString * contentText;
@property NSString * contentPubTime;
@property NSString * contentAvatar;
@property NSString * contentImages;
@property NSString * contentReplyIcon;
@property NSMutableArray * contentReply;
@end
