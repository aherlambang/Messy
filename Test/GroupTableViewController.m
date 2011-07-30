//
//  GroupTableViewController.m
//  Test
//
//  Created by Aditya Herlambang on 7/29/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import "GroupTableViewController.h"
#import "CVGroup.h"
#import <Three20/Three20+Additions.h>
#import <RestKit/Restkit.h>
#import <RestKit/Three20/Three20.h>


@implementation GroupTableViewController

- (id)initWithNavigatorURL:(NSURL *)URL query:(NSDictionary *)query {
	if (self = [super initWithNavigatorURL:URL query:query]) {
		self.title = @"Groups";
	}
	return self;
}

- (void) loadView
{
    [super loadView];

    RKObjectTTTableViewDataSource* dataSource = [RKObjectTTTableViewDataSource dataSource];
    RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[TTTableTextItem class]];
    [mapping mapKeyPath:@"name" toAttribute:@"text"];
    [dataSource mapObjectClass:[CVGroup class] toTableItemWithMapping:mapping];
    RKObjectLoader* objectLoader = [[RKObjectManager sharedManager] objectLoaderWithResourcePath:@"/groups.json" delegate:nil];
    dataSource.model = [RKObjectLoaderTTModel modelWithObjectLoader:objectLoader];
    self.dataSource = dataSource;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
