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
- (void)cleanup;
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



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	NSData *readData = [self applicationDataFromFile:@"save"];
	JBDataController *aDataController = [NSKeyedUnarchiver unarchiveObjectWithData:readData];
	
	if (!aDataController) {
		aDataController = [[JBDataController alloc] init];
		NSLog(@"First time startup, creating new DataController");
		firstLaunch = YES;
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

	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
	
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
	
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
	
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	[self cleanup];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	[self cleanup];
}


- (void)cleanup {
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
