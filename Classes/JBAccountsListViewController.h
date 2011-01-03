//
//  JBAccountsListViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  Used for the Accounts tab.

#import <UIKit/UIKit.h>
#import "JBDataController.h"
#import "JBAccount.h"
#import "JBTransactionValueView.h"
#import "JBAccountEditorViewController.h"
#import "JBAccountTransactionViewController.h"
#import "JBAllAccountsInspectorViewController.h"

@interface JBAccountsListViewController : UITableViewController {
	JBDataController *dataController; //holds a reference to all the accounts
	JBAccountEditorViewController *accountEditor;
	
	JBAccountTransactionViewController *accountInspector;
	JBAllAccountsInspectorViewController *allAccounts;
	
	BOOL newAccount;
}
@property (nonatomic, retain) JBDataController *dataController;
@property (nonatomic, retain) JBAccountEditorViewController *accountEditor;
@property (nonatomic, retain) JBAccountTransactionViewController *accountInspector;
@property (nonatomic, retain) JBAllAccountsInspectorViewController *allAccounts;
@property (nonatomic, assign) BOOL newAccount;

- (void)updateBalances;
- (double)balanceForAllAccounts;
@end
