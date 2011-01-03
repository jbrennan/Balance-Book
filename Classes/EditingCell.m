//
//  EditingCell.m
//  SimpleEditing
//
//  Created by Jason Brennan on 26/08/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "EditingCell.h"


@implementation EditingCell

@synthesize textField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Set the frame to CGRectZero as it will be reset in layoutSubviews
        textField = [[UITextField alloc] initWithFrame:CGRectZero];
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.font = [UIFont systemFontOfSize:32.0];
        textField.textColor = [UIColor darkGrayColor];
        [self addSubview:textField];
    }
    return self;
}

- (void)dealloc {
    // Release allocated resources.0
    [textField release];
    [super dealloc];
}

- (void)layoutSubviews {
    // Place the subviews appropriately.
    textField.frame = CGRectInset(self.contentView.bounds, 10, 0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Update text color so that it matches expected selection behavior.
    if (selected) {
        textField.textColor = [UIColor whiteColor];
    } else {
        textField.textColor = [UIColor darkGrayColor];
    }
}

@end
