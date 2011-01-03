//
//  TransactionItem.h
//  Transaction
//
//  Created by Jason Brennan on 24/07/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBAccount.h"
#import "JBTag.h"


@interface JBTransactionItem : NSObject <NSCoding> {
	NSString *transactionName;
	double transactionValue;
	
	NSString *accountName; //will eventually be an Account object
	JBAccount *transactionAccount;
	
	NSMutableArray *tags;
	
	/*
	 These two will be a part of the TransactionLocation class
	*/
	NSString *transactionLocationName;
	NSString *transactionLocationCoordinates;
	
	NSDate *transactionDate;
}
@property (nonatomic, retain) NSString *transactionName;
@property (nonatomic, assign) double transactionValue;
@property (nonatomic, retain) NSString *accountName;
@property (nonatomic, retain) JBAccount *transactionAccount;
@property (nonatomic, retain) NSMutableArray *tags;
@property (nonatomic, retain) NSString *transactionLocationName;
@property (nonatomic, retain) NSString *transactionLocationCoordinates;
@property (nonatomic, retain) NSDate *transactionDate;

- (id)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;
- (id)initWithDemoData;

@end
