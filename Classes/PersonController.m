//
//  PersonController.m
//  Balance Book
//
//  Created by Jason Brennan on 07/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "PersonController.h"


@implementation PersonController
@synthesize personList;

- (id)init {
	if (self = [super init]) {
		personList = [[NSMutableArray alloc] init];
		[self createDemoData];
	}
	return self;
}

- (void)createDemoData {
	Person *p = [[Person alloc] init];
	p.name = @"John";
	[personList addObject:p];
	p = nil;
	
	p = [[Person alloc] init];
	p.name = @"George";
	[personList addObject:p];
	p = nil;
	
	p = [[Person alloc] init];
	p.name = @"Ringo";
	[personList addObject:p];
	p = nil;
	
	p = [[Person alloc] init];
	p.name = @"Paul";
	[personList addObject:p];
	p = nil;
}
@end
