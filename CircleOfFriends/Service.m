//
//  Service.m
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "Service.h"
#import "ContentMapping.h"

@implementation Service

-(NSMutableArray*)readJson:(NSString*)file
{
    ReadJson *readJson = [ReadJson new];
    readJson.contentMapping = [[ContentMapping alloc]initWithContentUserName:@"ContentUserName" And:@"ContentText" And:@"ContentPubFrom" And:@"ContentAvatar"];
    return [readJson localfileWithContentsOfJSONString:file];
}

-(void)urlJson:(NSString*)url AsynBack:(Asyn) asynback
{
    [[UrlJson new] netfileWithContentsOfJSONString:url AsynBack:asynback];
}

@end
