//
//  TestAppDelegate.m
//  Test
//
//  Created by Aditya Herlambang on 7/29/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import "TestAppDelegate.h"

// RestKit
#import <RestKit/RestKit.h>
#import <RestKit/CoreData/CoreData.h>
#import <RestKit/Three20/Three20.h>
#import <RestKit/Support/JSON/JSONKit/RKJSONParserJSONKit.h>
#import <RestKit/Support/JSON/SBJSON/RKJSONParserSBJSON.h>
#import <RestKit/Support/JSON/YAJL/RKJSONParserYAJL.h>

// Three20
#import <Three20/Three20.h>
#import <Three20/Three20+Additions.h>

#import "TestObjectCache.h"
#import "GroupTableViewController.h"
#import "CVGroup.h"
#import "CVLogin.h"

@implementation TestAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    RKObjectManager* objectManager = [RKObjectManager objectManagerWithBaseURL:@"http://www.convore.com/api"];
    
    objectManager.client.username = @"kuntul";
    objectManager.client.password = @"restkiterror";

    [RKObjectLoaderTTModel setDefaultRefreshRate:1];

    objectManager.objectStore = [[[RKManagedObjectStore alloc] initWithStoreFilename:@"Test.sqlite"] autorelease];
	objectManager.objectStore.managedObjectCache = [[TestObjectCache new] autorelease];

    RKManagedObjectMapping* userMapping = [RKManagedObjectMapping mappingForClass:[CVLogin class]];
    userMapping.primaryKeyAttribute = @"mid";
    [userMapping mapKeyPath:@"id" toAttribute:@"mid"];
    [userMapping mapKeyPath:@"url" toAttribute:@"url"];
    [userMapping mapKeyPath:@"img" toAttribute:@"img"];
    [userMapping mapKeyPath:@"username" toAttribute:@"username"];
    
    RKManagedObjectMapping* groupMapping = [RKManagedObjectMapping mappingForClass:[CVGroup class]];
    groupMapping.primaryKeyAttribute = @"gid";
    [groupMapping mapKeyPath:@"name" toAttribute:@"name"];
    [groupMapping mapKeyPath:@"id" toAttribute:@"gid"];
    [groupMapping mapKeyPath:@"date_created" toAttribute:@"date_created"];
    [groupMapping mapKeyPath:@"date_latest_message" toAttribute:@"date_latest_message"];
    [groupMapping mapKeyPath:@"unread" toAttribute:@"unread"];
    [groupMapping mapKeyPath:@"topics_count" toAttribute:@"topics_count"];
    [groupMapping mapKeyPath:@"tracked" toAttribute:@"tracked"];
    [groupMapping mapKeyPath:@"primary_topic_id" toAttribute:@"primary_topic_id"];
    [groupMapping mapKeyPath:@"members_count" toAttribute:@"members_count"];
    [groupMapping mapKeyPath:@"kind" toAttribute:@"kind"];
    [groupMapping mapKeyPath:@"is_member" toAttribute:@"is_member"];
    [groupMapping mapKeyPath:@"slug" toAttribute:@"slug"];
    [groupMapping mapKeyPath:@"description" toAttribute:@"desc"];
    [groupMapping mapRelationship:@"creator" withObjectMapping:userMapping];
    
    [objectManager.mappingProvider registerMapping:groupMapping withRootKeyPath:@"groups"];
    [objectManager.mappingProvider registerMapping:userMapping withRootKeyPath:@"creator"];
    
    RKLogConfigureByName("RestKit", RKLogLevelDebug);
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelDebug);
    //RKLogConfigureByName("RestKit/Network", RKLogLevelDebug);
    //RKLogConfigureByName("RestKit/Network/Queue", RKLogLevelDebug);
    RKLogConfigureByName("RestKit/CoreData", RKLogLevelDebug);
    
    TTURLMap* map = [[TTNavigator navigator] URLMap];
    [map from:@"*" toViewController:[TTWebController class]];
	[map from:@"db://groups" toViewController:[GroupTableViewController class]];
    
    // Override point for customization after application launch.
    TTOpenURL(@"db://groups");
	[[TTNavigator navigator].window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
