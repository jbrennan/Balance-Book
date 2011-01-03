//
//  JBDetailCell.h
//  Balance Book
//
//  Created by Jason Brennan on 29/10/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  key:value pair for the various views in the app.


#import <UIKit/UIKit.h>


@interface JBDetailCell : UITableViewCell {
	UITextField *type;
	UITextField *name;
	
}
@property (readonly, retain) UITextField *type;
@property (readonly, retain) UITextField *name;
@end
