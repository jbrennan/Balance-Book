//
//  JBBalanceViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBBalanceViewController.h"
#import "Balance_BookAppDelegate.h"
#define RECENT_ITEMS_LIMIT 20
//@class Balance_BookAppDelegate;
@implementation JBBalanceViewController

@synthesize dataController;
@synthesize theItems;
@synthesize testItem;
@synthesize showFirstLaunchHelp;

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		self.title = @"Balance";
		UIBarButtonItem *addButton = [[UIBarButtonItem alloc] 
									  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
									  target:self 
									  action:@selector(addAction:)];
		
		self.navigationItem.rightBarButtonItem = addButton;
		self.tabBarItem.image = [UIImage imageNamed:@"balance.png"];
	}
	return self;
}

- (void)addAction:(id)sender {
	JBBalanceEditorViewController *editor = [[JBBalanceEditorViewController alloc] initWithStyle:UITableViewStyleGrouped];
	editor.editingContent = dataController.transactionItems;
	editor.dataController = self.dataController;
	[self.navigationController pushViewController:editor animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return (dataController.transactionItems.count > RECENT_ITEMS_LIMIT) ? RECENT_ITEMS_LIMIT : dataController.transactionItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
	}
	// Configure the cell
	
	//decoration:
	NSInteger delta = dataController.transactionItems.count - RECENT_ITEMS_LIMIT;
	NSInteger index = (dataController.transactionItems.count < RECENT_ITEMS_LIMIT) ? 
	(dataController.transactionItems.count - 1) - indexPath.row 
	: (RECENT_ITEMS_LIMIT - indexPath.row - 1) + delta;
	
	JBTransactionItem *theItem = [dataController.transactionItems objectAtIndex:index];
	
	NSString *imageName = [theItem transactionValue] < 0 ? @"ValueViewIconRedSmall.png" : @"ValueViewIconGreenSmall.png";
	NSString *itemValue = [NSString stringWithFormat:@"%1.2f", [theItem transactionValue]];
	
	JBTransactionValueView *valueView = [[JBTransactionValueView alloc] initWithImageNamed:imageName 
																				 itemValue:itemValue];
	cell.accessoryView = valueView;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.text = [theItem transactionName];
	
	
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	// TODO: this view should have an Edit button, not Save.
	NSInteger delta = dataController.transactionItems.count - RECENT_ITEMS_LIMIT;
	NSInteger index = (dataController.transactionItems.count < RECENT_ITEMS_LIMIT) ? 
	(dataController.transactionItems.count - 1) - indexPath.row 
	: (RECENT_ITEMS_LIMIT - indexPath.row - 1) + delta;
	
	JBBalanceEditorViewController *editor = [[JBBalanceEditorViewController alloc] initWithStyle:UITableViewStyleGrouped];
	editor.editingItem = [dataController.transactionItems objectAtIndex:index];
	editor.editingContent = dataController.transactionItems;
	editor.dataController = self.dataController;
	[self.navigationController pushViewController:editor animated:YES];
	
	
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @"Recent items";
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
	[theItems release];
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
	if (showFirstLaunchHelp) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome" 
														message:@"If this is your first time using Balance Book you might like to first set up an Account." 
													   delegate:self 
											  cancelButtonTitle:@"No thanks" 
											  otherButtonTitles:@"OK", nil];
		[alert show];
	}
	
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSLog(@"%d was clicked", buttonIndex);
	Balance_BookAppDelegate *appDelegate = (Balance_BookAppDelegate *)[[UIApplication sharedApplication] delegate];

	if (buttonIndex) {
		appDelegate.tabBarController.selectedIndex = 1;
		
	} else {
		appDelegate.accountsListViewController.newAccount = NO;
		NSLog(@"NO");
	}
	showFirstLaunchHelp = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
}

- (void)viewDidDisappear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
	NSLog(@"Balance got a memory warning!");
	[super didReceiveMemoryWarning];
}


@end

