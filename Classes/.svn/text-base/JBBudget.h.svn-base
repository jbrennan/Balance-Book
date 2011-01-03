//
//  JBBudget.h
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  Budget item.

#import <UIKit/UIKit.h>
#import "JBTransactionItem.h"


@interface JBBudget : NSObject <NSCoding> {
	NSString *budgetName;
	double budgetAmount;
	double budgetAmountRemaining;
	NSDate *budgetInterval; //might need a different type for this..
	NSMutableArray *budgetTags;
	NSString *budgetAccountName; //should be an account object
	NSMutableArray *budgetTransactionItems;
}
@property (nonatomic, retain) NSString *budgetName;
@property (nonatomic, assign) double budgetAmount;
@property (nonatomic, assign) double budgetAmountRemaining;
@property (nonatomic, retain) NSDate *budgetInterval;
@property (nonatomic, retain) NSMutableArray *budgetTags;
@property (nonatomic, retain) NSString *budgetAccountName;
@property (nonatomic, retain) NSMutableArray *budgetTransactionItems;

- (id)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;

- (double)calculateBudgetRemaining;
@end
