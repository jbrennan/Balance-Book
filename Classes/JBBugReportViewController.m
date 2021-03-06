//
//  JBBugReportViewController.m
//  Balance Book
//
//  Created by Jason Brennan on 09/10/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBBugReportViewController.h"


@implementation JBBugReportViewController


- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
		UIBarButtonItem *addButton = [[UIBarButtonItem alloc] 
									  initWithBarButtonSystemItem:UIBarButtonSystemItemDone
									  target:self 
									  action:@selector(cancelAction:)];
		
		self.navigationItem.rightBarButtonItem = addButton;
    }
    return self;
}

- (void)cancelAction:(id)sender {
	NSIndexPath *anIndex = [NSIndexPath indexPathForRow:0 inSection:0];
	UITableViewCell *theCell = [self.tableView cellForRowAtIndexPath:anIndex];
	UITextView *aTextView = (UITextView *)[theCell.contentView.subviews objectAtIndex:0];
	[aTextView resignFirstResponder];
}


// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
	self.tableView.scrollEnabled = NO;
	
    [super viewDidLoad];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    // Configure the cell
	if (indexPath.section == 0) {
		
		CGRect myFrame = CGRectMake( 10, 2, 280, 145 );

		UITextView *textView = [[UITextView alloc] initWithFrame:myFrame];
		textView.font = [UIFont systemFontOfSize:16];
		textView.text = @"Version 2008-10-30 \n";
		[cell.contentView addSubview:textView];
	} else {
		cell.textLabel.text = @"Email";
		cell.textLabel.textAlignment = UITextAlignmentCenter;
	}
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];

	if (indexPath.section == 1) {
		NSIndexPath *anIndex = [NSIndexPath indexPathForRow:0 inSection:0];
		
		UITableViewCell *theCell = [self.tableView cellForRowAtIndexPath:anIndex];
		UITextView *aTextView = (UITextView *)[theCell.contentView.subviews objectAtIndex:0];
		
		NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat: @"mailto:i.jasonbrennan@gmail.com?subject=Bug-Report&body=%@", 
													[aTextView.text stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
		[[UIApplication sharedApplication] openURL:url];
	}
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		return 148.0;
	} else {
		return 50.0;
	}
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


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
}
*/
/*
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
*/

- (void)dealloc {
    [super dealloc];
}


@end

