//
//  JBBudgetDetailEditorViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 20/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditingCell.h"
#import "JBBudget.h"

@interface JBBudgetDetailEditorViewController : UITableViewController {
	NSString *editingKey;
	JBBudget *editingItem;
	
	EditingCell *editingCell;
}
@property (nonatomic, retain) NSString *editingKey;
@property (nonatomic, retain) JBBudget *editingItem;
@property (nonatomic, retain) EditingCell *editingCell;

@end
