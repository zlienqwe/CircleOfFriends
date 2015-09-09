//
//  ContentModel.h
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentModel : NSObject

@property (nonatomic, strong) NSString * contentUserName;
@property (nonatomic, strong) NSString * contentText;
@property (nonatomic, strong) NSString * contentPubTime;
@property (nonatomic, strong) NSString * contentAvatar;
@property (nonatomic, strong) NSString * contentImages;
@property (nonatomic, strong) NSString * contentReplyIcon;
@property (nonatomic, strong) NSMutableArray * contentReply;


@end
