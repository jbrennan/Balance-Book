//
//  JBBudgetTagSelectionViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 21/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBBudgetTagSelectionViewController.h"


@implementation JBBudgetTagSelectionViewController
@synthesize dataController;
@synthesize tagDetailEditor;
@synthesize budgetItem;

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		self.title = @"Select tags";
		UIBarButtonItem *addButton = [[UIBarButtonItem alloc] 
									  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
									  target:self 
									  action:@selector(addAction:)];
		
		self.navigationItem.rightBarButtonItem = addButton;
	}
	return self;
}


- (void)addAction:(id)sender {
	JBTagDetailEditor *aDetailEditor = [[JBTagDetailEditor alloc] initWithStyle:UITableViewStyleGrouped];
	aDetailEditor.editingContent = dataController.tagItems;
	self.tagDetailEditor = aDetailEditor;
	[aDetailEditor release];
	
	[self.navigationController pushViewController:self.tagDetailEditor animated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return dataController.tagItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
	}
	// Configure the cell
	if ([self.budgetItem.budgetTags containsObject:[dataController.tagItems objectAtIndex:indexPath.row]]) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
	cell.textLabel.text = [[dataController.tagItems objectAtIndex:indexPath.row] tagName];
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
	
	if (cell.accessoryType == UITableViewCellAccessoryCheckmark){
		cell.accessoryType = UITableViewCellAccessoryNone;
		[budgetItem.budgetTags removeObject:[dataController.tagItems objectAtIndex:indexPath.row]];
	} else {
		[budgetItem.budgetTags addObject:[dataController.tagItems objectAtIndex:indexPath.row]];
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
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

