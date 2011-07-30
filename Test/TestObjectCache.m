//
//  TestObjectCache.m
//  Test
//
//  Created by Aditya Herlambang on 7/29/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import "TestObjectCache.h"
#import "CVGroup.h"

@implementation TestObjectCache

- (NSArray*)fetchRequestsForResourcePath:(NSString*)resourcePath {
    
	if ([resourcePath isEqualToString:@"/groups.json"]) {
        NSLog(@"FETCHING RESOURCE PATH");
		NSFetchRequest* request = [CVGroup fetchRequest];
        return [NSArray arrayWithObject:request];
	}
	
	return nil;
}

@end
