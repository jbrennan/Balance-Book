//
//  JBTag.m
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBTag.h"


@implementation JBTag
@synthesize tagName;

- (id)initWithName:(NSString *)name {
	if (self = [super init]) {
		self.tagName = name;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)coder {
	[super init];
	self.tagName = [coder decodeObjectForKey:@"tagName"];
	return self;
}


- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:tagName forKey:@"tagName"];
}
@end
