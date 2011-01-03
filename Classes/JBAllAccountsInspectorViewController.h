//
//  JBAllAccountsInspectorViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 27/10/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBDataController.h"
#import "JBTransactionValueView.h"
#import "JBBalanceEditorViewController.h"
#import "JBTransactionValueViewCell.h"

@interface JBAllAccountsInspectorViewController : UITableViewController {
	JBDataController *dataController;
	NSMutableArray *transactionItemsWithoutAccount;
	
	JBBalanceEditorViewController *balanceEditor;
}
@property (nonatomic, retain) JBDataController *dataController;
@property (nonatomic, retain) NSMutableArray *transactionItemsWithoutAccount;
@property (nonatomic, retain) JBBalanceEditorViewController *balanceEditor;
@end
