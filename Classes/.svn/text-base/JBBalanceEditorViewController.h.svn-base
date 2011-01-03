//
//  JBBalanceEditorViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  For inspecting/editing transaction items.

#import <UIKit/UIKit.h>
#import "JBTransactionItem.h"
#import "JBBalanceDetailEditorViewController.h"
#import "JBTagSelectionViewController.h"
#import "JBAccountPickerViewController.h"
#import "JBDataController.h"
#import "JBDetailCell.h"


@interface JBBalanceEditorViewController : UITableViewController {
	JBTransactionItem *editingItem;
	JBTransactionItem *copyOfItem;
	NSMutableArray *editingContent; //array containing all of the items
	JBDataController *dataController; // TODO: refactor this properly...
	
	JBBalanceDetailEditorViewController *detailController;
	JBTagSelectionViewController *tagSelector;
	JBAccountPickerViewController *accountPicker;
	BOOL newItem;
	double oldValue;
}
@property (nonatomic, retain) JBTransactionItem *editingItem;
@property (nonatomic, retain) JBTransactionItem *copyOfItem;
@property (nonatomic, retain) NSMutableArray *editingContent;
@property (nonatomic, retain) JBBalanceDetailEditorViewController *detailController;
@property (nonatomic, retain) JBTagSelectionViewController *tagSelector;
@property (nonatomic, retain) JBDataController *dataController;
@property (nonatomic, retain) JBAccountPickerViewController *accountPicker;
@end
