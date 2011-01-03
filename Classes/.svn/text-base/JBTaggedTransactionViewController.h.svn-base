//
//  JBTaggedTransactionViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 27/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  When you select a tag, this reveals all items with that tag

#import <UIKit/UIKit.h>
#import "JBDataController.h"
#import "JBTag.h"
#import "JBTransactionItem.h"
#import "JBTransactionValueView.h"
#import "JBBalanceEditorViewController.h"

@interface JBTaggedTransactionViewController : UITableViewController {
	JBDataController *dataController;
	JBTag *inspectedTag;
	
	NSMutableArray *transactionItems;
	JBBalanceEditorViewController *balanceEditor;
}
@property (nonatomic, retain) JBDataController *dataController;
@property (nonatomic, retain) JBTag *inspectedTag;
@property (nonatomic, retain) NSMutableArray *transactionItems;
@property (nonatomic, retain) JBBalanceEditorViewController *balanceEditor;

@end
