//
//  JBAccountTransactionViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 28/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBDataController.h"
#import "JBAccount.h"
#import "JBTransactionItem.h"
#import "JBTransactionValueView.h"
#import "JBBalanceEditorViewController.h"

@interface JBAccountTransactionViewController : UITableViewController {
	JBDataController *dataController;
	JBAccount *inspectedAccount;
	
	NSMutableArray *transactionItems;
	JBBalanceEditorViewController *balanceEditor;
}
@property (nonatomic, retain) JBDataController *dataController;
@property (nonatomic, retain) JBAccount *inspectedAccount;
@property (nonatomic, retain) NSMutableArray *transactionItems;
@property (nonatomic, retain) JBBalanceEditorViewController *balanceEditor;
@end
