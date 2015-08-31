//
//  Service.m
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "ReadJsonFileService.h"
#import "ContentMapping.h"

@implementation ReadJsonFileService

-(NSMutableArray*)readJson:(NSString*)file
{
    ReadJson *readJson = [ReadJson new];
    readJson.contentMapping = [[ContentMapping alloc]initWithContentUserName:@"ContentUserName" And:@"ContentText" And:@"ContentPubTime" And:@"ContentAvatar" And:@"ContentImages" And:@"ContentReply"];
    return [readJson localfileWithContentsOfJSONString:file];
}

@end
