//
//  CVRootObject.m
//  Cvore
//
//  Created by Aditya Herlambang on 7/25/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import "CVRootObject.h"

@implementation CVRootObject
@dynamic name;
@dynamic date_latest_message;
@dynamic date_created;
@dynamic tracked;
@dynamic unread;
@dynamic kind;

- (NSString *) encodedTopicName {
    return [self.name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


@end
