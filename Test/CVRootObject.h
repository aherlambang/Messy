//
//  CVRootObject.h
//  Cvore
//
//  Created by Aditya Herlambang on 7/25/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import <RestKit/RestKit.h>
#import <RestKit/CoreData/CoreData.h>
#import <Foundation/Foundation.h>

@class CVLogin;

@interface CVRootObject : NSManagedObject{
    
}


@property (nonatomic, retain) NSString * name;
//@property (nonatomic, retain) CVLogin * creator;
@property (nonatomic, retain) NSNumber * date_latest_message;
@property (nonatomic, retain) NSNumber * date_created;
@property (nonatomic, retain) NSNumber * tracked;
@property (nonatomic, retain) NSNumber * unread;
@property (nonatomic, retain) NSString * kind;

@end
