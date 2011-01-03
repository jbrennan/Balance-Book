//
//  JBTagSelectionViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBTagSelectionViewController.h"


@implementation JBTagSelectionViewController
@synthesize dataController;
@synthesize tagDetailEditor;
@synthesize transactionItem;

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
	//create a detail editor
	//pass it the tag array and a new tag and push it on the stack
	// TODO: editing/deleting tags... how? (maybe when a tag has been selected..)
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
	
	//TODO: Bug here: if one or more tags are checked and a new one is added
	// then that tag is automatically checked but not added to the array
	if ([transactionItem.tags containsObject:[dataController.tagItems objectAtIndex:indexPath.row]]) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
	cell.text = [[dataController.tagItems objectAtIndex:indexPath.row] tagName];
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
	
	if (cell.accessoryType == UITableViewCellAccessoryCheckmark){
		cell.accessoryType = UITableViewCellAccessoryNone;
		[transactionItem.tags removeObject:[dataController.tagItems objectAtIndex:indexPath.row]];
	} else {
		[transactionItem.tags addObject:[dataController.tagItems objectAtIndex:indexPath.row]];
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
	//add the selected tag to the transaction's set of tags
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

