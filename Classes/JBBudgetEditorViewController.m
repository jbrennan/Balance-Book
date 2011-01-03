//
//  JBBudgetEditorViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 16/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBBudgetEditorViewController.h"


@implementation JBBudgetEditorViewController
@synthesize editingItem;
@synthesize copyOfItem;
@synthesize editingContent;
@synthesize detailController;
@synthesize tagController;
@synthesize dataController;

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		//self.title = @"New Budget";
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
		editingItem.budgetName = copyOfItem.budgetName;
		editingItem.budgetInterval = copyOfItem.budgetInterval;
		editingItem.budgetTags = copyOfItem.budgetTags;
		editingItem.budgetTransactionItems = copyOfItem.budgetTransactionItems;
		editingItem.budgetAmountRemaining = copyOfItem.budgetAmountRemaining;
		editingItem.budgetAmount = copyOfItem.budgetAmount;
		editingItem.budgetAccountName = copyOfItem.budgetAccountName;
		
		editingItem.budgetAmountRemaining = editingItem.budgetAmount;
		[editingContent addObject:editingItem];
		newItem = NO;
	} else {
		editingItem.budgetName = copyOfItem.budgetName;
		editingItem.budgetInterval = copyOfItem.budgetInterval;
		editingItem.budgetTags = copyOfItem.budgetTags;
		editingItem.budgetTransactionItems = copyOfItem.budgetTransactionItems;
		editingItem.budgetAmountRemaining = copyOfItem.budgetAmountRemaining;
		editingItem.budgetAmount = copyOfItem.budgetAmount;
		editingItem.budgetAccountName = copyOfItem.budgetAccountName;
	}

	[self.navigationController popViewControllerAnimated:YES];
}

- (void)setEditingItem:(JBBudget *)anItem {
	[editingItem release];
	editingItem = [anItem retain];
	JBBudget *item = [[JBBudget alloc] init];
	item.budgetName = editingItem.budgetName;
	item.budgetInterval = editingItem.budgetInterval;
	item.budgetTags = editingItem.budgetTags;
	item.budgetTransactionItems = editingItem.budgetTransactionItems;
	item.budgetAmountRemaining = editingItem.budgetAmountRemaining;
	item.budgetAmount = editingItem.budgetAmount;
	item.budgetAccountName = editingItem.budgetAccountName;
	
	self.copyOfItem = item;
	[item release];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 3;
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
			cell.name.text = copyOfItem.budgetName;
			break;
		case 1:
			cell.type.text = @"Amount";
			cell.name.text = [NSString stringWithFormat:@"%1.2f",  copyOfItem.budgetAmount];
			break;
		case 2:
			cell.type.text = @"Tags";
			cell.name.text = [NSString stringWithFormat:@"%d", copyOfItem.budgetTags.count];
			break;
	}
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	JBBudgetDetailEditorViewController *controller = [[JBBudgetDetailEditorViewController alloc] initWithStyle:UITableViewStyleGrouped];
	controller.editingItem = self.copyOfItem;
	switch (indexPath.row) {
		case 0:
			//cell.text = @"Name";
			controller.editingKey = @"budgetName";
			break;
		case 1:
			//cell.text = @"Amount";
			controller.editingKey = @"budgetAmount";
			break;
		case 2:{
			JBBudgetTagSelectionViewController *aController = [[JBBudgetTagSelectionViewController alloc] initWithStyle:UITableViewStylePlain];
			if (self.copyOfItem.budgetTags == nil) {
				self.copyOfItem.budgetTags = [[NSMutableArray alloc] init];
			}
			aController.budgetItem = self.copyOfItem;
			aController.dataController = self.dataController;
			self.tagController = aController;
			[aController release];
			[self.navigationController pushViewController:self.tagController animated:YES];
			return;
		}
	}
	self.detailController = controller;
	[controller release];
	[self.navigationController pushViewController:self.detailController animated:YES];
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
		editingItem = [[JBBudget alloc] init];
		newItem = YES;
		self.title = @"New Budget";
	} else {
		self.title = @"Budget";
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

