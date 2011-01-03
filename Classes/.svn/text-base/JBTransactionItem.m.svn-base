//
//  TransactionItem.m
//  Transaction
//
//  Created by Jason Brennan on 24/07/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBTransactionItem.h"


@implementation JBTransactionItem
@synthesize transactionName;
@synthesize transactionValue;
@synthesize accountName;
@synthesize transactionAccount;
@synthesize tags;
@synthesize transactionLocationName;
@synthesize transactionLocationCoordinates;
@synthesize transactionDate;

- (id)initWithDemoData {
	if (self = [super init]) {
		self.transactionName = @"New CD";
		self.transactionValue = 20;
		self.accountName = @"Chequing";
		self.tags = [[NSMutableArray alloc] initWithObjects:@"tag1", @"tag2", nil];
		self.transactionLocationName = @"HMV";
		self.transactionLocationCoordinates = @"Rideau";
		self.transactionDate = [NSDate date];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)coder {
	if (self = [super init]) {
		self.transactionName = [coder decodeObjectForKey:@"transactionName"];
		self.transactionValue = [coder decodeDoubleForKey:@"transactionValue"];
		self.accountName = [coder decodeObjectForKey:@"accountName"];
		self.transactionAccount = [coder decodeObjectForKey:@"transactionAccount"];
		self.tags = [coder decodeObjectForKey:@"tags"];
		self.transactionLocationName = [coder decodeObjectForKey:@"transactionLocationName"];
		self.transactionLocationCoordinates = [coder decodeObjectForKey:@"transactionLocationCoordinates"];
		self.transactionDate = [coder decodeObjectForKey:@"transactionDate"];
	}
	return self;
}


- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:transactionName forKey:@"transactionName"];
	[coder encodeDouble:transactionValue forKey:@"transactionValue"];
	[coder encodeObject:accountName forKey:@"accountName"];
	[coder encodeObject:transactionAccount forKey:@"transactionAccount"];
	[coder encodeObject:tags forKey:@"tags"];
	[coder encodeObject:transactionLocationName forKey:@"transactionLocationName"];
	[coder encodeObject:transactionLocationCoordinates forKey:@"transactionLocationCoordinates"];
	[coder encodeObject:transactionDate forKey:@"transactionDate"];
}

@end
