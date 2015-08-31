//
//  contentMapping.m
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "contentMapping.h"


@interface ContentMapping()
{
@private NSString* _contentUserName;
@private NSString* _contentText;
@private NSString* _contentPubTime;
@private NSString* _contentAvatar;
@private NSString* _contentImages;
@private NSString* _contentReply;
}

@end

@implementation ContentMapping


-(ContentMapping *)initWithContentUserName:(NSString *)contentUserName And:(NSString *)contentText And:(NSString *)contentPubTime And:(NSString *)contentAvatar And:(NSString *)contentImages And:(NSString *)contentReply
{
    if ((self = [super init])) {
        _contentUserName = contentUserName;
        _contentText = contentText;
        _contentPubTime = contentPubTime;
        _contentAvatar = contentAvatar;
        _contentImages = contentImages;
        _contentReply = contentReply;
    }
    return self;
}


-(NSMutableArray*)mappingContentArray:(NSArray *)contentArray
{
    NSMutableArray *array= [[NSMutableArray alloc] init];
    [contentArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ContentModel *content = [self mappingContent:obj];
        [array addObject:content];
    }];
    return array;
}


-(ContentModel*) mappingContent:(NSDictionary *)contentData
{
    ContentModel * content = [ContentModel new];
    content.contentUserName = [contentData objectForKey:_contentUserName];
    content.contentText = [contentData objectForKey:_contentText];
    content.contentPubTime = [contentData objectForKey:_contentPubTime];
    content.contentAvatar = [contentData objectForKey:_contentAvatar];
    content.contentImages = [contentData objectForKey:_contentImages];
    content.contentReply = [contentData objectForKey:_contentReply];
    return content;
}

@end
