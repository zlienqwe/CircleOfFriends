//
//  Service.h
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReadJson.h"
#import "UrlJson.h"
@interface Service : NSObject

-(NSMutableArray*)readJson:(NSString*)file;
-(void)urlJson:(NSString*)url AsynBack:(Asyn) asynback;

@end