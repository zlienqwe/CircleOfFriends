//
//  FriendsInfoMapping.m
//  CircleOfFriends
//
//  Created by Zlien on 8/25/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "ContentInfoMapping.h"

@implementation ContentInfoMapping
+(ContentModel*) contentInfo:(NSMutableArray*) contentArray{
    ContentModel * contentInfoList = [ContentModel new];
    contentInfoList.contentUserName=[contentArray valueForKey:@"contentUserName"];
    contentInfoList.contentAvatar=[contentArray valueForKey:@"contentAvatar"];
    contentInfoList.contentText=[contentArray valueForKey:@"contentText"];
    contentInfoList.contentPubFrom=[contentArray valueForKey:@"contentPubFrom"];
    contentInfoList.contentImages = [contentArray valueForKey:@"contentImages"];
    contentInfoList.contentReply = [contentArray valueForKey:@"contentReply"];
    return contentInfoList;

    
    
}
@end
