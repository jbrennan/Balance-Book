//
//  NewPersonViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 07/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "NewPersonViewController.h"


@implementation NewPersonViewController
@synthesize editingCell;
@synthesize editingPerson;
@synthesize editingContent;


- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] 
									   initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
									   target:self 
									   action:@selector(save:)];
		
		self.navigationItem.rightBarButtonItem = saveButton;
	}
	return self;
}

- (void)save:(id)sender {
	editingPerson = [[Person alloc] init];
	editingPerson.name = editingCell.textField.text;
	
	[editingContent addObject:editingPerson];
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



/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}
*/
/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (editingStyle == UITableViewCellEditingStyleDelete) {
	}
	if (editingStyle == UITableViewCellEditingStyleInsert) {
	}
}
*/



- (void)dealloc {
	[editingCell release];
	[super dealloc];
}


- (void)viewDidLoad {
	[super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
	editingCell = [[EditingCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"tagCell"];
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

