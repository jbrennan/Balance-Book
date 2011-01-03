//
//  JBTransactionValueViewCell.h
//  Balance Book
//
//  Created by Jason Brennan on 04/11/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBTransactionValueView.h"

@interface JBTransactionValueViewCell : UITableViewCell {
	JBTransactionValueView *valueView;
	UITextField *name;
}
@property (nonatomic, retain) JBTransactionValueView *valueView;
@property (nonatomic, retain) UITextField *name;

@end
