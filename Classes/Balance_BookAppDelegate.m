//
//  Balance_BookAppDelegate.m
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright Jason Brennan 2008. All rights reserved.
//

#import "Balance_BookAppDelegate.h"
#import "JBBalanceViewController.h"


@interface Balance_BookAppDelegate ()
- (NSData *)applicationDataFromFile:(NSString *)fileName;
- (BOOL)writeApplicationData:(NSData *)data toFile:(NSString *)fileName;
@end



@implementation Balance_BookAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize tabBarController;
@synthesize balanceNav, accountsNav, budgetsNav, tagsNav, bugNav;

@synthesize dataController;
@synthesize balanceViewController;
@synthesize accountsListViewController;
@synthesize budgetsViewController;
@synthesize tagsViewController;
@synthesize bugReportViewController;





- (void)applicationDidFinishLaunching:(UIApplication *)application {
	NSData *readData = [self applicationDataFromFile:@"save"];
	JBDataController *aDataController = [NSKeyedUnarchiver unarchiveObjectWithData:readData];
	
	if (!aDataController) {
		aDataController = [[JBDataController alloc] init];
		NSLog(@"First time startup, creating new DataController");
		firstLaunch = YES;
		/*
		JBTransactionItem *item = [[JBTransactionItem alloc] initWithDemoData];
		JBAccount *account = [[JBAccount alloc] initWithDemoData];
		[aDataController.accountItems addObject:account];
		[aDataController.transactionItems addObject:item];
		
		JBTag *tag1 = [[JBTag alloc] initWithName:@"entertainment"];
		JBTag *tag2 = [[JBTag alloc] initWithName:@"junk food"];
		[aDataController.tagItems addObject:tag1];
		[aDataController.tagItems addObject:tag2];
		
		JBBudget *budget1 = [[JBBudget alloc] initWithName:@"Entertainment"	amount:70 interval:[NSDate date] tags:nil account:@"CIBC"];
		[aDataController.budgetItems addObject:budget1];
		 */
	}
	
	
	self.dataController = aDataController;
	[aDataController release];
	//[dataController.transactionItems removeObjectAtIndex:0];
	
	//Setup all the ViewControllers for the tabs :)
	//Balance (set up test first item for now)
	JBBalanceViewController *aBalance = [[JBBalanceViewController alloc] initWithStyle:UITableViewStyleGrouped];
	aBalance.showFirstLaunchHelp = firstLaunch;
	aBalance.dataController = self.dataController;
	self.balanceNav = [[UINavigationController alloc] initWithRootViewController:aBalance];
	
	[aBalance release];
	
	//Accounts
	JBAccountsListViewController *anAccounts = [[JBAccountsListViewController alloc] initWithStyle:UITableViewStyleGrouped];
	anAccounts.newAccount = firstLaunch;
	anAccounts.dataController = self.dataController;
	self.accountsListViewController = anAccounts;
	self.accountsNav = [[UINavigationController alloc] initWithRootViewController:anAccounts];
	[anAccounts release];
	[anAccounts release];
	
	//Budgets
	JBBudgetsViewController *aBudgets = [[JBBudgetsViewController alloc] initWithStyle:UITableViewStyleGrouped];
	aBudgets.dataController = self.dataController;
	self.budgetsNav = [[UINavigationController alloc] initWithRootViewController:aBudgets];
	[aBudgets release];
	
	//Tags
	JBTagsViewController *aTags = [[JBTagsViewController alloc] initWithStyle:UITableViewStylePlain];
	aTags.dataController = self.dataController;
	self.tagsNav = [[UINavigationController alloc] initWithRootViewController:aTags];
	[aTags release];
	
	/*
	JBBugReportViewController *bug = [[JBBugReportViewController alloc] initWithStyle:UITableViewStyleGrouped];
	bug.title = @"Bugs";
	UINavigationController *aBugNav = [[UINavigationController alloc] initWithRootViewController:bug];
	self.bugNav = aBugNav;
	[aBugNav release];
	[bug release];
	 */
	
	//Configure the tab bar controller, and add items to it.
	UITabBarController *aTabBarController = [[UITabBarController alloc] init];
	aTabBarController.viewControllers = [NSArray arrayWithObjects:self.balanceNav, self.accountsNav, self.budgetsNav, self.tagsNav, nil];
	self.tabBarController = aTabBarController;
	[aTabBarController release];
	
	
	// Configure and show the window
	[window addSubview:[tabBarController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
	NSData *dataToSave = [NSKeyedArchiver archivedDataWithRootObject:dataController];
	[self writeApplicationData:dataToSave toFile:@"save"];
}


- (BOOL)writeApplicationData:(NSData *)data toFile:(NSString *)fileName { 
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
														 NSUserDomainMask, YES); 
	NSString *documentsDirectory = [paths objectAtIndex:0]; 
	if (!documentsDirectory) { 
		NSLog(@"Documents directory not found!"); 
		return NO; 
	} 
	NSString *appFile = [documentsDirectory 
						 stringByAppendingPathComponent:fileName]; 
	return ([data writeToFile:appFile atomically:YES]); 
}

- (NSData *)applicationDataFromFile:(NSString *)fileName { 
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
														 NSUserDomainMask, YES); 
	NSString *documentsDirectory = [paths objectAtIndex:0]; 
	NSString *appFile = [documentsDirectory 
						 stringByAppendingPathComponent:fileName]; 
	NSData *myData = [[[NSData alloc] initWithContentsOfFile:appFile] 
					  autorelease]; 
	return myData; 
}



- (void)dealloc {
	//TODO: need to release everything!!
	[tabBarController release];
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
