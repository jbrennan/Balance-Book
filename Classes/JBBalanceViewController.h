//
//  JBBalanceViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  Used for showing the "Balance Book" part of the app.

#import <UIKit/UIKit.h>
#import "JBDataController.h"
#import "JBTransactionItem.h"
#import "JBBalanceEditorViewController.h"
#import "JBTransactionValueView.h"
//#import "Balance_BookAppDelegate.h"
@class Balance_BookAppDelegate;

@interface JBBalanceViewController : UITableViewController <UIAlertViewDelegate> {
	
	JBDataController *dataController;
	
	NSMutableArray *theItems; //array of transaction items
	
	//test item//
	JBTransactionItem *testItem;
	
	BOOL showFirstLaunchHelp;
}
@property (nonatomic, retain) JBDataController *dataController;
@property (nonatomic, retain) NSMutableArray *theItems;
@property (nonatomic, retain) JBTransactionItem *testItem;
@property (nonatomic, assign) BOOL showFirstLaunchHelp;

@end
