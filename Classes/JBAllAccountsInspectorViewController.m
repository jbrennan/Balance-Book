//
//  JBAllAccountsInspectorViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 27/10/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBAllAccountsInspectorViewController.h"


@implementation JBAllAccountsInspectorViewController
@synthesize dataController;
@synthesize transactionItemsWithoutAccount;
@synthesize balanceEditor;
/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/

- (void)updateTransactionItems {
	//figure out what transaction items have the account in question
	// and store them somewhere!
	
	// TODO: make this much more efficient
	NSMutableArray *theItems;
	for (JBAccount *account in dataController.accountItems) {
		theItems = [[NSMutableArray alloc] init];
		
		for (JBTransactionItem *t in dataController.transactionItems) {
			if ([t.transactionAccount.accountName isEqualToString:account.accountName]) {
				//THIS IS A HUGE MESS
				if (![theItems containsObject:t]){
					[theItems addObject:t];
				}
			} /* else if (!t.transactionAccount) {
				if (![transactionItemsWithoutAccount containsObject:t]) {
					[transactionItemsWithoutAccount addObject:t];
				}
			} */
			
		}
		account.transactionItems = theItems;
		[theItems release];
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return dataController.accountItems.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[[dataController.accountItems objectAtIndex:section] transactionItems] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    // Configure the cell
	
	JBTransactionItem *cellItem = [[[dataController.accountItems objectAtIndex:indexPath.section] transactionItems] objectAtIndex:indexPath.row];
	// BUG: here. Don't know what it is though. Causes crash in rapid scrolling :/
	NSString *imageName = cellItem.transactionValue < 0 ? @"ValueViewIconRedSmall.png" : @"ValueViewIconGreenSmall.png";
	NSString *itemValue = [NSString stringWithFormat:@"%1.2f", cellItem.transactionValue];

	JBTransactionValueView *theValueView = [[JBTransactionValueView alloc] initWithImageNamed:imageName itemValue:itemValue];
	cell.accessoryView = theValueView;
	
	//[theValueView release];
	cell.textLabel.text = cellItem.transactionName;
	
	//[cellItem release];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	JBBalanceEditorViewController *ed = [[JBBalanceEditorViewController alloc] initWithStyle:UITableViewStyleGrouped];
	ed.editingItem = [[[dataController.accountItems objectAtIndex:indexPath.section] transactionItems] objectAtIndex:indexPath.row];
	ed.dataController = self.dataController;
	self.balanceEditor = ed;
	[ed release];
	
	[self.navigationController pushViewController:self.balanceEditor animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
		return [[dataController.accountItems objectAtIndex:section] accountName];
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
	/*
	if (!transactionItemsWithoutAccount) {
		transactionItemsWithoutAccount = [[NSMutableArray alloc] init];
	}
	 */
    [super viewWillAppear:animated];
	[self updateTransactionItems];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
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

