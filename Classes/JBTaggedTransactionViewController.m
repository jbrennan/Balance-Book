//
//  JBTaggedTransactionViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 27/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBTaggedTransactionViewController.h"


@implementation JBTaggedTransactionViewController
@synthesize dataController;
@synthesize inspectedTag;
@synthesize transactionItems;
@synthesize balanceEditor;


- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		
	}
	return self;
}

- (void)updateTransactionItems {
	//figure out what transaction items have the tag in question
	// and store them somewhere!
	
	// TODO: make this much more efficient
	if (!transactionItems) {
		transactionItems = [[NSMutableArray alloc] init];
	}
	for (JBTransactionItem *t in dataController.transactionItems) {
		if ([t.tags containsObject:self.inspectedTag]) {
			if (![transactionItems containsObject:t]){
				[transactionItems addObject:t];
			}
		}
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return transactionItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
	}
	// Configure the cell
	JBTransactionItem *theItem = [transactionItems objectAtIndex:indexPath.row];

	NSString *imageName = theItem.transactionValue < 0 ? @"ValueViewIconRedSmall.png" : @"ValueViewIconGreenSmall.png";
	NSString *itemValue = [NSString stringWithFormat:@"%1.2f", theItem.transactionValue];
	
	JBTransactionValueView *theValueView = [[JBTransactionValueView alloc] initWithImageNamed:imageName itemValue:itemValue];
	cell.accessoryView = theValueView;
	
	[theValueView release];
	cell.textLabel.text = theItem.transactionName;
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// TODO: when an item is selected, show the item's details
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	JBBalanceEditorViewController *ed = [[JBBalanceEditorViewController alloc] initWithStyle:UITableViewStyleGrouped];
	ed.editingItem = [transactionItems objectAtIndex:indexPath.row];
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


- (void)dealloc {
	[super dealloc];
}


- (void)viewDidLoad {
	[super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
	self.title = inspectedTag.tagName;
	[self updateTransactionItems];
	[self.tableView reloadData];
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
}

- (void)viewDidDisappear:(BOOL)animated {
	transactionItems = nil;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}


@end

