//
//  ReadJson.h
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContentMapping.h"


@interface ReadJson : NSObject

@property ContentMapping *contentMapping;
-(NSMutableArray*)localfileWithContentsOfJSONString:(NSString*)fileLocation;

@end
