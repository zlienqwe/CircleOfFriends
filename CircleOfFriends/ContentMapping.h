//
//  contentMapping.h
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContentModel.h"

@interface ContentMapping : NSObject



-(ContentMapping*)initWithContentUserName:(NSString*) contentUserName And:(NSString*) contentText And:(NSString*) contentPubFrom And:(NSString*) contentAvatar And:(NSString *) contentImages And:(NSString *) contentReply;
-(NSMutableArray*)mappingContentArray:(NSArray*)contentArray;
-(ContentModel*) mappingContent:(NSDictionary*)contentData;
@end
