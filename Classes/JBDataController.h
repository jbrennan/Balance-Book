//
//  DataController.h
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  Keeps track of all currently active models

#import <UIKit/UIKit.h>
#import "JBTransactionItem.h"
#import "JBAccount.h"
#import "JBTag.h"
#import "JBBudget.h"


@interface JBDataController : NSObject <NSCoding> {
	//tags, accounts, transactions, budgets
	NSMutableArray *transactionItems;
	NSMutableArray *accountItems;
	NSMutableArray *tagItems;
	NSMutableArray *budgetItems;
	NSString *dataControllerVersion;
}
@property (nonatomic, retain) NSMutableArray *transactionItems;
@property (nonatomic, retain) NSMutableArray *accountItems;
@property (nonatomic, retain) NSMutableArray *tagItems;
@property (nonatomic, retain) NSMutableArray *budgetItems;
@property (nonatomic, retain) NSString *dataControllerVersion;

- (id)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;
@end
