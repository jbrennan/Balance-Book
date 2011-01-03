//
//  JBTagSelectionViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  Used for selecting which tags an item should have.

#import <UIKit/UIKit.h>
#import "JBDataController.h"
#import "JBTag.h"
#import "JBTagDetailEditor.h"
#import "JBTransactionItem.h"

@interface JBTagSelectionViewController : UITableViewController {
	JBDataController *dataController;
	JBTagDetailEditor *tagDetailEditor;
	JBTransactionItem *transactionItem; // a filthy hack
}
@property (nonatomic, retain) JBDataController *dataController;
@property (nonatomic, retain) JBTagDetailEditor *tagDetailEditor;
@property (nonatomic, retain) JBTransactionItem *transactionItem;
@end
