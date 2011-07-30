//
//  Login.h
//  Cvore
//
//  Created by Aditya Herlambang on 5/4/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface CVLogin : NSManagedObject {
  
}

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSNumber * mid;
@property (nonatomic, retain) NSString * img;

@end



