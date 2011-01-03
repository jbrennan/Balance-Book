//
//  JBAccountPickerViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 28/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBAccountPickerViewController.h"


@implementation JBAccountPickerViewController
@synthesize dataController;
@synthesize editingItem;

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		self.title = @"Choose an Account";
	}
	return self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return dataController.accountItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
	}
	// Configure the cell
	NSString *theName = [[dataController.accountItems objectAtIndex:indexPath.row] accountName];
	cell.textLabel.text = theName;
	if ([editingItem.transactionAccount.accountName isEqualToString:theName]){
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//add make the selected account be the account for the item and then pop the view
	UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryCheckmark;
	// TODO: MAKE THIS NOT A HACK
	// see: JBBalanceEditorViewController.m for the inverse of this
	//subtract the item out of the old account, then
	//remove the transaction from whatever account it currently belongs to first
	//editingItem.transactionAccount.accountBalance -= editingItem.transactionValue;
	[editingItem.transactionAccount.transactionItems removeObject:editingItem];
	//then set it's new account
	editingItem.transactionAccount = [dataController.accountItems objectAtIndex:indexPath.row];
	
	//then add that transaction item to the list of items for the selected account
	if (![[[dataController.accountItems objectAtIndex:indexPath.row] transactionItems] containsObject:editingItem]){
		[[[dataController.accountItems objectAtIndex:indexPath.row] transactionItems] addObject:editingItem];
	}
	[self.navigationController popViewControllerAnimated:YES];
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


- (void)dealloc {
	[super dealloc];
}


- (void)viewDidLoad {
	[super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
}

- (void)viewDidDisappear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}


@end

