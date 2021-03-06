//
//  JBTagsViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  Used for the tags tab.

#import <UIKit/UIKit.h>
#import "JBDataController.h"
#import "JBTransactionItem.h"
#import "JBTagDetailEditor.h"
#import "JBTaggedTransactionViewController.h"

@interface JBTagsViewController : UITableViewController {
	JBDataController *dataController;
	JBTagDetailEditor *tagDetailEditor;
	JBTaggedTransactionViewController *tagInspector;
}
@property (nonatomic, retain) JBDataController *dataController;
@property (nonatomic, retain) JBTagDetailEditor *tagDetailEditor;
@property (nonatomic, retain) JBTaggedTransactionViewController *tagInspector;
@end
