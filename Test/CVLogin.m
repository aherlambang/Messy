//
//  Login.m
//  Cvore
//
//  Created by Aditya Herlambang on 5/4/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import "CVLogin.h"


@implementation CVLogin
@dynamic username;
@dynamic mid;
@dynamic url;
@dynamic img;


+ (NSString*)primaryKeyProperty {
    return @"mid";
}

@end
