//
//  Account.h
//  SimpleEditing
//
//  Created by Jason Brennan on 27/08/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  Basic account model... will likely need to expand this!
//  Also, will likely need an AccountController to manage.

#import <UIKit/UIKit.h>


@interface JBAccount : NSObject <NSCoding> {
	NSString *accountName;		//Checking
	NSString *accountBankName;	//CIBC
	NSString *currency;			//CDN$
	
	NSMutableArray *transactionItems;
	double accountBalance;	//+900
	
	//Other members:
	//icon?
	//data such as dates (account creation/recent items)?
	//
	
}

@property(nonatomic, retain) NSString *accountName;		//Checking
@property(nonatomic, retain) NSString *accountBankName;	//CIBC
@property(nonatomic, retain) NSString *currency;			//CDN$
@property(nonatomic, retain) NSMutableArray *transactionItems;
@property(nonatomic, assign) double accountBalance;	//+900

- (void)calculateBalance;
- (id)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;
@end
