//
//  JBTagsViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBTagsViewController.h"


@implementation JBTagsViewController
@synthesize dataController;
@synthesize tagDetailEditor;
@synthesize tagInspector;

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		self.title = @"Tags";
		UIBarButtonItem *addButton = [[UIBarButtonItem alloc] 
									   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
									   target:self 
									   action:@selector(addAction:)];
		
		self.navigationItem.rightBarButtonItem = addButton;
		self.navigationItem.leftBarButtonItem = self.editButtonItem;
		self.tableView.allowsSelectionDuringEditing = YES;
		self.tabBarItem.image = [UIImage imageNamed:@"tags.png"];
		
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
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textLabel.text = [[dataController.tagItems objectAtIndex:indexPath.row] tagName];
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//selecting a tag reveals a view with all items containing that tag
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if (self.editing) {
		NSLog(@"Editing. Item clicked (tags)");
		if (!tagDetailEditor) {
		JBTagDetailEditor *aDetailEditor = [[JBTagDetailEditor alloc] initWithStyle:UITableViewStyleGrouped];
		aDetailEditor.editingContent = dataController.tagItems;
		self.tagDetailEditor = aDetailEditor;
		[aDetailEditor release];
		}
		tagDetailEditor.editingTag = [dataController.tagItems objectAtIndex:indexPath.row];
		
		[self.navigationController pushViewController:self.tagDetailEditor animated:YES];
		[self.tableView reloadData];
	} else {
		JBTaggedTransactionViewController *inspector = [[JBTaggedTransactionViewController alloc] initWithStyle:UITableViewStylePlain];
		inspector.inspectedTag = [dataController.tagItems objectAtIndex:indexPath.row];
		inspector.dataController = self.dataController;
		self.tagInspector = inspector;
		[inspector release];
		
		[self.navigationController pushViewController:self.tagInspector animated:YES];
	}
	
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)aTableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Editing? %d", self.editing);
	return UITableViewCellAccessoryDisclosureIndicator;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	[super setEditing:editing animated:animated];	
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		for (JBTransactionItem *t in dataController.transactionItems) {
			if ([t.tags containsObject:[dataController.tagItems objectAtIndex:indexPath.row]]) {
				[t.tags removeObject:[dataController.tagItems objectAtIndex:indexPath.row]];
			}
		}
		[dataController.tagItems removeObjectAtIndex:indexPath.row];
	}
	if (editingStyle == UITableViewCellEditingStyleInsert) {
	}
	[self.tableView reloadData];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

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

