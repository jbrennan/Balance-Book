//
//  NewPersonViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 07/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditingCell.h"
#import "Person.h"

#define MAKERECT CGRectMake(0.0, 10.0, 100, 25)

@interface NewPersonViewController : UITableViewController {
	EditingCell *editingCell;
	Person *editingPerson;
	NSMutableArray *editingContent;
}
@property (nonatomic, retain) EditingCell *editingCell;
@property (nonatomic, retain) Person *editingPerson;
@property (nonatomic, retain) NSMutableArray *editingContent;
@end
