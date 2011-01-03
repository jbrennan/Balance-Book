//
//  JBBalanceDetailEditorViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 09/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  Edits one row of the TransactionItem.
//  Pass it a string of the item to be edited.

#import <UIKit/UIKit.h>
#import "JBTransactionItem.h"
#import "EditingCell.h"

@interface JBBalanceDetailEditorViewController : UITableViewController {
	NSString *editingDetail; //key
	JBTransactionItem *editingItem;
	
	EditingCell *editingCell;
}
@property (nonatomic, retain) NSString *editingDetail;
@property (nonatomic, retain) JBTransactionItem *editingItem;
@property (nonatomic, retain) EditingCell *editingCell;

@end
