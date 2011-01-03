//
//  JBAccountPickerViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 28/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBDataController.h"
#import "JBTransactionItem.h"
#import "JBAccount.h"

@interface JBAccountPickerViewController : UITableViewController {
	JBDataController *dataController;
	JBTransactionItem *editingItem;
}
@property (nonatomic, retain) JBDataController *dataController;
@property (nonatomic, retain) JBTransactionItem *editingItem;
@end
