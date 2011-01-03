//
//  JBBudget.m
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBBudget.h"


@implementation JBBudget
@synthesize budgetName;
@synthesize budgetAmount;
@synthesize budgetAmountRemaining;
@synthesize budgetInterval;
@synthesize budgetTags;
@synthesize budgetAccountName;
@synthesize budgetTransactionItems;

- (id)initWithName:(NSString *)name 
			amount:(NSInteger)amount 
		  interval:(NSDate *)interval 
			  tags:(NSMutableArray *)tags 
		   account:(NSString *)account {
	if (self = [super init]) {
		self.budgetName = name;
		self.budgetAmount = amount;
		self.budgetInterval = interval;
		self.budgetTags = tags;
		self.budgetAccountName = account;
		
		//when the budget is first created there is nothing gone from the budget.
		self.budgetAmountRemaining = amount;
	}
	return self;
}


- (id)initWithCoder:(NSCoder *)coder {
	if (self = [super init]) {
		self.budgetName = [coder decodeObjectForKey:@"budgetName"];
		self.budgetAmount = [coder decodeDoubleForKey:@"budgetAmount"];
		self.budgetAmountRemaining = [coder decodeDoubleForKey:@"budgetAmountRemaining"];
		self.budgetInterval = [coder decodeObjectForKey:@"budgetInterval"];
		self.budgetTags = [coder decodeObjectForKey:@"budgetTags"];
		self.budgetAccountName = [coder decodeObjectForKey:@"budgetAccount"];
	}
	return self;
}


- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:budgetName forKey:@"budgetName"];
	[coder encodeDouble:budgetAmount forKey:@"budgetAmount"];
	[coder encodeDouble:budgetAmountRemaining forKey:@"budgetAmountRemaining"];
	[coder encodeObject:budgetInterval forKey:@"budgetInterval"];
	[coder encodeObject:budgetTags forKey:@"budgetTags"];
	[coder encodeObject:budgetAccountName forKey:@"budgetAccount"];
}




- (double)calculateBudgetRemaining {
	//difference of the budgeted amount - all deductions from it
	//(ie things with matching tags)
	double total = budgetAmount;
	if (budgetTransactionItems.count <  1) {
		return budgetAmount;
	} else {
		for (JBTransactionItem *item in budgetTransactionItems) {
			total += item.transactionValue;
		}
	}
	return total;
}
@end
