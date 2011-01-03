//
//  JBTagDetailEditor.m
//  Balance Book
//
//  Created by Jason Brennan on 14/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBTagDetailEditor.h"


@implementation JBTagDetailEditor
@synthesize editingTag;
@synthesize editingContent;
@synthesize editingCell;

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] 
									   initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
									   target:self 
									   action:@selector(saveAction:)];
		
		self.navigationItem.rightBarButtonItem = saveButton;
	}
	return self;
}

- (void)saveAction:(id)sender {
	editingTag.tagName = editingCell.textField.text;
	
	if (newItem) {
		[editingContent addObject:editingTag];
		newItem = NO;
	}
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


- (void)dealloc {
	[super dealloc];
}


- (void)viewDidLoad {
	[super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
	editingCell = [[EditingCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"editingCell"];
	
	if (editingTag == nil) {
		// we're creating a new item, so flag it so save: knows what to add it to the array
		editingTag = [[JBTag alloc] init];
		editingCell.textField.placeholder = @"Enter a new tag";
		newItem = YES;
	}
	editingCell.textField.text = editingTag.tagName;
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

