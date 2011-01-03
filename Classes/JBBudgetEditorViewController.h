//
//  JBBudgetEditorViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 16/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  For creating/inspecting budgets.

#import <UIKit/UIKit.h>
#import "JBBudget.h"
#import "JBBudgetDetailEditorViewController.h"
#import "JBBudgetTagSelectionViewController.h"
#import "JBDataController.h"
#import "JBDetailCell.h"

@interface JBBudgetEditorViewController : UITableViewController {
	JBBudget *editingItem; //the new item in question
	JBBudget *copyOfItem;
	NSMutableArray *editingContent; //the array of all budgets
	JBDataController *dataController; // TODO: this is a mess.
	
	JBBudgetDetailEditorViewController *detailController;
	JBBudgetTagSelectionViewController *tagController;
	BOOL newItem;
}
@property (nonatomic, retain) JBBudget *editingItem;
@property (nonatomic, retain) JBBudget *copyOfItem;
@property (nonatomic, retain) NSMutableArray *editingContent;
@property (nonatomic, retain) JBBudgetDetailEditorViewController *detailController;
@property (nonatomic, retain) JBBudgetTagSelectionViewController *tagController;
@property (nonatomic, retain) JBDataController *dataController;

@end
