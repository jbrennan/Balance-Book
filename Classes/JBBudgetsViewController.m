//
//  JBBudgetViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBBudgetsViewController.h"


@implementation JBBudgetsViewController
@synthesize dataController;
@synthesize editorController;
@synthesize budgetInspector;

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		self.title = @"Budgets";
		UIBarButtonItem *addButton = [[UIBarButtonItem alloc] 
									  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
									  target:self 
									  action:@selector(addAction:)];
		
		self.navigationItem.rightBarButtonItem = addButton;
		self.navigationItem.leftBarButtonItem = self.editButtonItem;
		self.tableView.allowsSelectionDuringEditing = YES;
		self.tabBarItem.image = [UIImage imageNamed:@"chart.png"];
	}
	return self;
}


- (void)addAction:(id)sender {
	JBBudgetEditorViewController *controller = [[JBBudgetEditorViewController alloc] initWithStyle:UITableViewStyleGrouped];
	controller.editingContent = dataController.budgetItems;
	controller.dataController = self.dataController;
	self.editorController = controller;
	[self.navigationController pushViewController:self.editorController animated:YES];
}

// TODO: this is probably super leaky...sigh.
- (void)updateTransactionItemsInBudgets {
	NSMutableArray *tempItems;
	for (JBBudget *budget in dataController.budgetItems) {
		tempItems = [[NSMutableArray alloc] init];
		for (JBTransactionItem *t in dataController.transactionItems) {
			//for each tag in the inspected budget
			for (JBTag *bTag in budget.budgetTags) {
				if ([t.tags containsObject:bTag]) {
					// hurrah! don't add it twice...
					
					if (![tempItems containsObject:t]) {
						[tempItems addObject:t];
					}//if
				}//if
			}//for tag
		}//for item
		budget.budgetTransactionItems = tempItems;
		tempItems = nil;
	}//for budget
	
	// look through each item
	
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return dataController.budgetItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
	}
	// Configure the cell
	JBBudget *theBudget = [dataController.budgetItems objectAtIndex:indexPath.row];
	
	double amountRemaining = [theBudget calculateBudgetRemaining];
	NSString *imageName;
	if (theBudget.budgetAmount == amountRemaining) {
		imageName = @"ValueViewIconGreenSmall.png";
	} else if (amountRemaining > 0) {
		imageName = @"ValueViewIconYellowSmall.png";
	} else {
		imageName = @"ValueViewIconRedSmall.png";
	}
	
	NSString *imageValue = [NSString stringWithFormat:@"%1.2f", amountRemaining];
	JBTransactionValueView *valueView = [[JBTransactionValueView alloc] initWithImageNamed:imageName 
																				 itemValue:imageValue];
	cell.accessoryView = valueView;
	cell.text = theBudget.budgetName;
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];	
	
	//TODO: refactor the creation of the editing controller to a method
	/*
	 JBBudgetEditorViewController *controller = [[JBBudgetEditorViewController alloc] initWithStyle:UITableViewStyleGrouped];
	 controller.editingContent = dataController.budgetItems;
	 controller.dataController = self.dataController;
	 controller.editingItem = [dataController.budgetItems objectAtIndex:indexPath.row];
	 self.editorController = controller;
	 
	 */
	if (self.editing) {
		NSLog(@"Editing. Item clicked");
		if (!editorController) {
			//TODO: BUG: if a budget gets changed, but "Back" is pressed, the update stays.
			
			JBBudgetEditorViewController *controller = [[JBBudgetEditorViewController alloc] initWithStyle:UITableViewStyleGrouped];
			controller.editingContent = dataController.budgetItems;
			controller.dataController = self.dataController;
			self.editorController = controller;
		}
		editorController.editingItem = [dataController.budgetItems objectAtIndex:indexPath.row];
		editorController.editingContent = dataController.budgetItems;
		editorController.dataController = self.dataController;
		
		[self.navigationController pushViewController:self.editorController animated:YES];
		[self.tableView reloadData];
	} else {
		JBBudgetTransactionItemsViewController *controller = [[JBBudgetTransactionItemsViewController alloc] initWithStyle:UITableViewStylePlain];
		controller.dataController = self.dataController;
		controller.inspectedBudget = [dataController.budgetItems objectAtIndex:indexPath.row];
		self.budgetInspector = controller;
		[controller release];
		
		[self.navigationController pushViewController:self.budgetInspector animated:YES];
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	return  @"\nBudgets update themselves by matching their tags with Balance items tags.";
}

// The accessory view is on the right side of each cell. We'll use a "disclosure" indicator in editing mode,
// to indicate to the user that selecting the row will navigate to a new view where details can be edited.
- (UITableViewCellAccessoryType)tableView:(UITableView *)aTableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Editing? %d", self.editing);
	return (self.editing) ? UITableViewCellAccessoryDetailDisclosureButton : UITableViewCellAccessoryNone;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	[super setEditing:editing animated:animated];	
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		[dataController.budgetItems removeObjectAtIndex:indexPath.row];
		NSLog(@"A budget was deleted");
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
	[self updateTransactionItemsInBudgets];
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

