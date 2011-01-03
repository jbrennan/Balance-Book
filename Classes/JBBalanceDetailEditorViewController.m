//
//  JBBalanceDetailEditorViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 09/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBBalanceDetailEditorViewController.h"


@implementation JBBalanceDetailEditorViewController
@synthesize editingItem;
@synthesize editingDetail;
@synthesize editingCell;

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		self.title = @"Edit";
		UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] 
									   initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
									   target:self 
									   action:@selector(save:)];
		
		self.navigationItem.rightBarButtonItem = saveButton;
	}
	return self;
}

- (void)save:(id)sender {
	if ([editingDetail isEqualToString:@"transactionValue"]) {
		NSIndexPath *anIndex = [NSIndexPath indexPathForRow:0 inSection:1];
		
		UITableViewCell *theCell = [self.tableView cellForRowAtIndexPath:anIndex];
		UISwitch *aSwitch = (UISwitch *)theCell.accessoryView;
		NSLog(@"%d", aSwitch.on);
		double value = [editingCell.textField.text doubleValue];
		if (aSwitch.on) {
			value = -1 * fabs(value);
		} else {
			value = fabs(value);
		}

		editingItem.transactionValue = value;
		[self.navigationController popViewControllerAnimated:YES];
		return;
		
	}
	
	
	[editingItem setValue:editingCell.textField.text forKey:editingDetail];
	
	[self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [editingDetail isEqualToString:@"transactionValue"] ? 2 : 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		return editingCell;
	} else {
		static NSString *Identifier = @"Identifier";
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:Identifier] autorelease];
		}
		UISwitch *debitSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
		debitSwitch.on = editingItem.transactionValue > 0 ? NO : YES;
		cell.accessoryView = debitSwitch;
		[debitSwitch release];
		cell.text = @"Withdrawal";
		return cell;
	}
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)dealloc {
	[super dealloc];
}


- (void)viewDidLoad {
	[super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
	// Set up the editor cell.
	editingCell = [[EditingCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"detailCell"];
	
	
	// Because the value is a double and not an object...
	if ([editingDetail isEqualToString:@"transactionValue"]) {
		editingCell.textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
		NSString *value = [NSString stringWithFormat:@"%1.2f", editingItem.transactionValue];
		editingCell.textField.text = value;
	} else {
		editingCell.textField.text = [editingItem valueForKey:editingDetail];
	}
	
	[editingCell.textField becomeFirstResponder];
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

