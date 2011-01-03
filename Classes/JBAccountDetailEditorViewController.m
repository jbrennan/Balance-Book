//
//  JBAccountDetailEditorViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 23/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBAccountDetailEditorViewController.h"


@implementation JBAccountDetailEditorViewController
@synthesize editingKey;
@synthesize editingItem;
@synthesize editingCell;

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		self.title = @"Edit";
		UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] 
									   initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
									   target:self 
									   action:@selector(saveAction:)];
		
		self.navigationItem.rightBarButtonItem = saveButton;
	}
	return self;
}


- (void)saveAction:(id) sender {
	[editingItem setValue:editingCell.textField.text forKey:editingKey];
	[self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return editingCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
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
	editingCell = [[EditingCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"detailCell"];
	if ([editingKey isEqualToString:@"accountBalance"]) {
		editingCell.textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
		editingCell.textField.text = [NSString stringWithFormat:@"%1.2f", editingItem.accountBalance];
	} else {
		editingCell.textField.text = [editingItem valueForKey:editingKey];
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

