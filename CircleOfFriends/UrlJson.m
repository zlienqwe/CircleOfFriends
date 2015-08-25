//
//  UrlJson.m
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "UrlJson.h"

@implementation UrlJson
-(void)netfileWithContentsOfJSONString:(NSString*)jsonurl AsynBack:(Asyn) asynback{
    
    NSURL *url = [NSURL URLWithString:jsonurl];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url
                                                  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                              timeoutInterval:60.0f];
    
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:asynback];
}

@end
