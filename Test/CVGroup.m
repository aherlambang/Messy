//
//  Group.m
//  Cvore
//
//  Created by Aditya Herlambang on 5/4/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import "CVGroup.h"
#import "CVLogin.h"

@implementation CVGroup
@dynamic gid;
@dynamic topics_count;
@dynamic primary_topic_id;
@dynamic members_count;
@dynamic kind;
@dynamic is_member;
@dynamic desc;
@dynamic slug;
@dynamic options;

+ (NSString*)primaryKeyProperty {
	return @"gid";
}

/*
- (NSString *) encodedGroupName {
    return [self.name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
*/

@end
