//
//  EditingCell.h
//  SimpleEditing
//
//  Created by Jason Brennan on 26/08/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EditingCell : UITableViewCell {
	UITextField *textField;
}
@property(nonatomic, retain) UITextField *textField;

@end
