//
//  JBBudgetTagSelectionViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 21/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBDataController.h"
#import "JBTagDetailEditor.h"
#import "JBBudget.h"

@interface JBBudgetTagSelectionViewController : UITableViewController {
	JBDataController *dataController;
	JBTagDetailEditor *tagDetailEditor;
	JBBudget *budgetItem;
}
@property (nonatomic, retain) JBDataController *dataController;
@property (nonatomic, retain) JBTagDetailEditor *tagDetailEditor;
@property (nonatomic, retain) JBBudget *budgetItem;
@end
