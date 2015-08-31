//
//  Service.h
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonFileToString.h"
@interface ReadJsonFileService : NSObject

-(NSMutableArray*)readJsonFile:(NSString*)file;

@end
