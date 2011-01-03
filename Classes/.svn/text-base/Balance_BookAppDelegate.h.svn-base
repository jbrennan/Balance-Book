//
//  Balance_BookAppDelegate.h
//  Balance Book
//
//  Created by Jason Brennan on 08/09/08.
//  Copyright Jason Brennan 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBDataController.h"
#import "JBBalanceViewController.h"
#import "JBAccountsListViewController.h"
#import "JBBudgetsViewController.h"
#import "JBTagsViewController.h"
#import "JBBugReportViewController.h"
#import "JBAccount.h"
#import "JBTag.h"
#import "JBBudget.h"

@class JBBalanceViewController;
@interface Balance_BookAppDelegate : NSObject <UIApplicationDelegate> {
	
	IBOutlet UIWindow *window;
	IBOutlet UINavigationController *navigationController;
	UITabBarController *tabBarController;
	JBDataController *dataController;
	
	//Nav Controllers
	UINavigationController *balanceNav;
	UINavigationController *accountsNav;
	UINavigationController *budgetsNav;
	UINavigationController *tagsNav;
	UINavigationController *bugNav;
	
	//View Controllers
	JBBalanceViewController *balanceViewController;
	JBAccountsListViewController *accountsListViewController;
	JBBudgetsViewController *budgetsViewController;
	JBTagsViewController *tagsViewController;
	JBBugReportViewController *bugReportViewController;
	
	BOOL firstLaunch;
	
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) UITabBarController *tabBarController;

@property (nonatomic, retain) UINavigationController *balanceNav;
@property (nonatomic, retain) UINavigationController *accountsNav;
@property (nonatomic, retain) UINavigationController *budgetsNav;
@property (nonatomic, retain) UINavigationController *tagsNav;
@property (nonatomic, retain) UINavigationController *bugNav;

@property (nonatomic, retain) JBDataController *dataController;
@property (nonatomic, retain) JBBalanceViewController *balanceViewController;
@property (nonatomic, retain) JBAccountsListViewController *accountsListViewController;
@property (nonatomic, retain) JBBudgetsViewController *budgetsViewController;
@property (nonatomic, retain) JBTagsViewController *tagsViewController;
@property (nonatomic, retain) JBBugReportViewController *bugReportViewController;

@end

