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
    ContentModel * contentInfo = [ContentModel new];
    contentInfo.contentUserName=[contentArray valueForKey:@"contentUserName"];
    contentInfo.contentAvatar=[contentArray valueForKey:@"contentAvatar"];
    contentInfo.contentText=[contentArray valueForKey:@"contentText"];
    contentInfo.contentPubFrom=[contentArray valueForKey:@"contentPubFrom"];
    contentInfo.contentImages = [contentArray valueForKey:@"contentImages"];
    return contentInfo;

    
    
}
@end
