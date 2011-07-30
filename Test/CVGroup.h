//
//  Group.h
//  Cvore
//
//  Created by Aditya Herlambang on 5/4/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "CVRootObject.h"

@class CVLogin;

@interface CVGroup : CVRootObject {
   
}

@property (nonatomic, retain) NSNumber * topics_count;
@property (nonatomic, retain) NSNumber * gid;
@property (nonatomic, retain) NSNumber * is_member;
@property (nonatomic, retain) NSNumber * primary_topic_id;
@property (nonatomic, retain) NSNumber * members_count;
@property (nonatomic, retain) NSString * slug;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, assign) BOOL options;

@end
