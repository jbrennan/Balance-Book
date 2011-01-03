//
//  NamesListViewController.h
//  Balance Book
//
//  Created by Jason Brennan on 07/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonController.h"
#import "NewPersonViewController.h"


@interface NamesListViewController : UITableViewController {
	PersonController *thePeople;
	NewPersonViewController *newController;
}
@property (nonatomic, retain) PersonController *thePeople;
@property (nonatomic, retain) NewPersonViewController *newController;

- (void)addAction:(id)sender;
@end
