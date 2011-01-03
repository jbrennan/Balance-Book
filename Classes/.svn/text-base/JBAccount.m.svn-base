//
//  Account.m
//  SimpleEditing
//
//  Created by Jason Brennan on 27/08/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBAccount.h"


@implementation JBAccount
@synthesize accountName, accountBankName, currency, transactionItems, accountBalance;

- (id)initWithDemoData {
	if (self = [super init]) {
		self.accountName = @"Checking";
		self.accountBankName = @"CIBC";
		self.currency = @"CAD";
		self.accountBalance = 2500;
		//self.transactionItems = aSetOfTransactionItems;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)coder {
	if (self = [super init]) {
		self.accountName = [coder decodeObjectForKey:@"accountName"];
		self.accountBankName = [coder decodeObjectForKey:@"accountBankName"];
		self.currency = [coder decodeObjectForKey:@"currency"];
		self.accountBalance = [coder decodeDoubleForKey:@"accountBalance"];
		self.transactionItems = [[NSMutableArray alloc] init];
	}
	return self;
}


- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:accountName forKey:@"accountName"];
	[coder encodeObject:accountBankName forKey:@"accountBankName"];
	[coder encodeObject:currency forKey:@"currency"];
	[coder encodeDouble:accountBalance forKey:@"accountBalance"];
}


- (void)calculateBalance {
	
}
@end
