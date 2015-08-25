//
//  UrlJson.h
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlJson : NSObject
typedef void (^Asyn)(NSURLResponse* response, NSData* data, NSError* connectionError);

-(void)netfileWithContentsOfJSONString:(NSString*)jsonurl AsynBack:(Asyn) asynback;

@end
