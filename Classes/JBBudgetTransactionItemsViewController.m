//
//  JBBudgetTransactionItemsViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 08/10/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBBudgetTransactionItemsViewController.h"


@implementation JBBudgetTransactionItemsViewController
@synthesize dataController;
@synthesize inspectedBudget;
@synthesize balanceEditor;
//@synthesize transactionItems;

/*
- (id)initWithStyle:(UITableViewStyle)style {
    if (self = [super initWithStyle:style]) {
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return inspectedBudget.budgetTransactionItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    // Configure the cell
	
	JBTransactionItem *theItem = [inspectedBudget.budgetTransactionItems objectAtIndex:indexPath.row];
	
	NSString *imageName = theItem.transactionValue < 0 ? @"ValueViewIconRedSmall.png" : @"ValueViewIconGreenSmall.png";
	NSString *itemValue = [NSString stringWithFormat:@"%1.2f", theItem.transactionValue];
	
	JBTransactionValueView *theValueView = [[JBTransactionValueView alloc] initWithImageNamed:imageName itemValue:itemValue];
	cell.accessoryView = theValueView;
	
	[theValueView release];
	cell.textLabel.text = theItem.transactionName;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	JBBalanceEditorViewController *ed = [[JBBalanceEditorViewController alloc] initWithStyle:UITableViewStyleGrouped];
	ed.editingItem = [inspectedBudget.budgetTransactionItems objectAtIndex:indexPath.row];
	ed.dataController = self.dataController;
	self.balanceEditor = ed;
	[ed release];
	
	[self.navigationController pushViewController:self.balanceEditor animated:YES];
}


/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
    }
    if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}
*/
/*
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/
/*
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/
/*
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/



- (void)viewWillAppear:(BOOL)animated {
	self.title = inspectedBudget.budgetName;
	//[self updateTransactionItems];
	[self.tableView reloadData];
    [super viewWillAppear:animated];
}

/*
- (void)viewWillDisappear:(BOOL)animated {
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
}
*/
/*
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
*/

- (void)dealloc {
    [super dealloc];
}


@end

