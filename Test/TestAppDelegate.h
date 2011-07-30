//
//  TestAppDelegate.h
//  Test
//
//  Created by Aditya Herlambang on 7/29/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TestAppDelegate : NSObject <UIApplicationDelegate>
{
     UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
