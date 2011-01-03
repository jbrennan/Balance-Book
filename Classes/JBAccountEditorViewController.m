//
//  JBAccountEditorViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 23/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBAccountEditorViewController.h"


@implementation JBAccountEditorViewController
@synthesize editingItem;
@synthesize copyOfItem;
@synthesize dataController;
@synthesize detailEditor;

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] 
									   initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
									   target:self 
									   action:@selector(saveAction:)];
		self.navigationItem.rightBarButtonItem = saveButton;
	}
	return self;
}


- (void)saveAction:(id)sender {
	if (newItem) {
		editingItem.accountName = copyOfItem.accountName;
		editingItem.accountBankName = copyOfItem.accountBankName;
		editingItem.accountBalance = copyOfItem.accountBalance;
		editingItem.currency = copyOfItem.currency;
		editingItem.transactionItems = copyOfItem.transactionItems;
		[dataController.accountItems addObject:editingItem];
		newItem = NO;
	} else {
		editingItem.accountName = copyOfItem.accountName;
		editingItem.accountBankName = copyOfItem.accountBankName;
		editingItem.accountBalance = copyOfItem.accountBalance;
		editingItem.currency = copyOfItem.currency;
		editingItem.transactionItems = copyOfItem.transactionItems;
	}

	[self.navigationController popViewControllerAnimated:YES];
}

- (void)setEditingItem:(JBAccount *)anItem {
	[editingItem release];
	editingItem = [anItem retain];
	JBAccount *item = [[JBAccount alloc] init];
	item.accountName = editingItem.accountName;
	item.accountBankName = editingItem.accountBankName;
	item.accountBalance = editingItem.accountBalance;
	item.currency = editingItem.currency;
	item.transactionItems = editingItem.transactionItems;
	
	self.copyOfItem = item;
	[item release];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	
	JBDetailCell *cell = (JBDetailCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[JBDetailCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
	}
	// Configure the cell
	switch (indexPath.row) {
		case 0:
			cell.type.text = @"Name";
			cell.name.text = copyOfItem.accountName;
			break;
		case 1:
			cell.type.text = @"Bank";
			cell.name.text = copyOfItem.accountBankName;
			break;
		case 2:
			cell.type.text = @"Currency";
			cell.name.text = copyOfItem.currency;
			break;
		case 3:
			cell.type.text = @"Balance";
			cell.name.text = [NSString stringWithFormat:@"$%1.2f", copyOfItem.accountBalance];
			break;
	}

	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	JBAccountDetailEditorViewController *ed = [[JBAccountDetailEditorViewController alloc] initWithStyle:UITableViewStyleGrouped];
	ed.editingItem = self.copyOfItem;
	
	switch (indexPath.row) {
		case 0:
			ed.editingKey = @"accountName";
			break;
		case 1:
			ed.editingKey = @"accountBankName";
			break;
		case 2:
			ed.editingKey = @"currency";
			break;
		case 3:
			ed.editingKey = @"accountBalance";
			break;
	}
	self.detailEditor = ed;
	[ed release];
	
	[self.navigationController pushViewController:self.detailEditor animated:YES];
	
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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
	
	if (editingItem == nil) {
		JBAccount *item = [[JBAccount alloc] init];
		self.editingItem = item;
		[item release];
		newItem = YES;
		self.title = @"New Account";
	} else {
		self.title = @"Account";
	}
	
	[self.tableView reloadData];
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

